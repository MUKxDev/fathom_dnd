import 'package:fathom_dnd/app/core/custom_base_view_model.dart';
import 'package:fathom_dnd/app/services/app/router_service.dart';
import 'package:stacked/stacked.dart';

import '../../../../../app/locator/locator.dart';
import '../../../../../app/models/character.dart';
import '../../../../../app/router/router.dart';
import '../../../../../app/services/api/auth_service.dart';
import '../../../../../app/services/api/fathom_dnd_service.dart';
import '../../../../../app/services/app/character_service.dart';

class CharacterSelectionViewModel extends ReactiveViewModel {
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_characterService];
/* -------------------------------------------------------------------------- */
/*                                  Services                                  */
/* -------------------------------------------------------------------------- */
  final FathomDndService _fathomDndService = locator<FathomDndService>();
  final CharacterService _characterService = locator<CharacterService>();
  final RouterService _routerService = locator<RouterService>();
  final AuthService _authService = locator<AuthService>();

  List<Character> get characters => _characterService.charactersList;

  get displayName => _authService.stackedAuth.currentUser?.displayName;

  Future<void> init() async {
    setBusy(true);
    if (_authService.stackedAuth.currentUser != null) {
      await _fathomDndService.getUserCharacters();
    } else {
      await _authService.stackedAuth.logout();
      _routerService.router.pushAndPopUntil(
        const AuthParentRoute(),
        predicate: (route) => false,
      );
    }
    setBusy(false);
  }

  addNewCharacter() async {
    await _routerService.router
        .navigate(const NewCharacterRoute())
        .then((value) async => await _fathomDndService.getUserCharacters());
  }

  onCharacterSelections(int index) async {
    _characterService.updateCharacter(characters[index]);
    await _routerService.homeRouter?.navigate(const DashboardRoute());
  }

  Future<void> refresh() async {
    await _fathomDndService.getUserCharacters();
  }
}
