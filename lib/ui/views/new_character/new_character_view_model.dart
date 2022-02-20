import 'package:fathom_dnd/app/core/custom_base_view_model.dart';
import 'package:fathom_dnd/app/models/basic_info.dart';
import 'package:fathom_dnd/app/models/character.dart';
import 'package:fathom_dnd/app/services/api/auth_service.dart';
import 'package:flutter/material.dart';

import '../../../app/locator/locator.dart';
import '../../../app/services/api/fathom_dnd_service.dart';
import '../../../app/services/app/router_service.dart';
import '../../../app/utils/utils.dart';

class NewCharacterViewModel extends CustomBaseViewModel {
/* -------------------------------------------------------------------------- */
/*                                  Services                                  */
/* -------------------------------------------------------------------------- */
  final FathomDndService _fathomDndService = locator<FathomDndService>();
  final RouterService _routerService = locator<RouterService>();
  final AuthService _authService = locator<AuthService>();

/* -------------------------------------------------------------------------- */
/*                                   Values                                   */
/* -------------------------------------------------------------------------- */
  TextEditingController nameController = TextEditingController();

  TextEditingController raceController = TextEditingController();

  TextEditingController classController = TextEditingController();

  TextEditingController backStoryController = TextEditingController();

/* -------------------------------------------------------------------------- */
/*                                  Functions                                 */
/* -------------------------------------------------------------------------- */
  Future<void> init() async {}

  createNewCharacter() async {
    setBusy(true);
    bool _name = Utils.boolRequiredValidation(nameController.text.trim());
    bool _race = Utils.boolRequiredValidation(raceController.text.trim());
    bool _characterClass =
        Utils.boolRequiredValidation(classController.text.trim());
    if (_name &&
        _race &&
        _characterClass &&
        _authService.stackedAuth.currentUser != null) {
      BasicInfo basicInfo = BasicInfo(
        name: nameController.text.trim(),
        race: raceController.text.trim(),
        characterClass: classController.text.trim(),
        isAlive: true,
        backStory: backStoryController.text.trim() != ''
            ? backStoryController.text.trim()
            : null,
      );
      Character _newCharacter = Character(
          userId: _authService.stackedAuth.currentUser!.uid,
          basicInfo: basicInfo);

      bool isCreated =
          await _fathomDndService.createNewCharacter(_newCharacter);

      _routerService.router.pop(isCreated);
    }
    setBusy(false);
  }
}
