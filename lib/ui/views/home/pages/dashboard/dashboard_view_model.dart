import 'package:fathom_dnd/app/core/custom_base_view_model.dart';
import 'package:fathom_dnd/app/locator/locator.dart';
import 'package:fathom_dnd/app/models/character.dart';
import 'package:fathom_dnd/app/router/router.dart';
import 'package:fathom_dnd/app/services/api/auth_service.dart';
import 'package:fathom_dnd/app/services/app/router_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

import '../../../../../app/services/app/character_service.dart';

class DashboardViewModel extends ReactiveViewModel {
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_characterService];
/* -------------------------------------------------------------------------- */
/*                                  Services                                  */
/* -------------------------------------------------------------------------- */
  final CharacterService _characterService = locator<CharacterService>();
  final RouterService _routerService = locator<RouterService>();
  final AuthService _authService = locator<AuthService>();

/* -------------------------------------------------------------------------- */
/*                                   Values                                   */
/* -------------------------------------------------------------------------- */
  User? get user => _authService.stackedAuth.currentUser;
  Character? get character => _characterService.character;

/* -------------------------------------------------------------------------- */
/*                                  Functions                                 */
/* -------------------------------------------------------------------------- */
  Future<void> init() async {
    setBusy(true);

    // Make sure there is a signed in user
    if (user == null) {
      await _authService.stackedAuth.currentUser?.reload();
      if (_authService.stackedAuth.currentUser == null) {
        // if there is no signed in user navigate to auth
        _routerService.router.pushAndPopUntil(
          const AuthParentRoute(),
          predicate: (route) => false,
        );
      }
    }

    setBusy(false);
  }
}
