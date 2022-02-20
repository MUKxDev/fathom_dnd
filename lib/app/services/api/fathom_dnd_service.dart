import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fathom_dnd/app/services/api/auth_service.dart';
import 'package:fathom_dnd/app/services/api/firestore_service.dart';
import 'package:fathom_dnd/app/utils/logger.dart';
import 'package:injectable/injectable.dart';

import '../../locator/locator.dart';
import '../../models/character.dart';
import '../app/character_service.dart';

@lazySingleton
class FathomDndService {
  /* -------------------------------------------------------------------------- */
  /*                                  Services                                  */
  /* -------------------------------------------------------------------------- */
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthService _authService = locator<AuthService>();
  final CharacterService _characterService = locator<CharacterService>();

  /* -------------------------------------------------------------------------- */
  /*                                  Functions                                 */
  /* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                                     Add                                    */
/* -------------------------------------------------------------------------- */
  Future<bool> createNewCharacter(Character character) async {
    try {
      DocumentReference documentReference = _firestoreService.characters.doc();
      Character newCharacter = character.copyWith(id: documentReference.id);
      await documentReference.set(newCharacter.toMap());

      debug(
          documentReference.id, 'FathomDndService => createNewCharacter => id');
      return true;
    } catch (e) {
      debug(
        'Error creating new character',
        'FathomDndService => createNewCharacter => id',
        e,
      );
      return false;
    }
  }

/* -------------------------------------------------------------------------- */
/*                                     get                                    */
/* -------------------------------------------------------------------------- */
  getUserCharacters() async {
    String? _userId = _authService.stackedAuth.currentUser?.uid;
    if (_userId != null) {
      await _firestoreService.characters
          .where('userId', isEqualTo: _userId)
          .get()
          .then((querySnapshot) {
        List<Character> _characters = [];
        for (var doc in querySnapshot.docs) {
          Character character = Character.fromMap(doc.data());
          character = character.copyWith(id: doc.id);
          _characters.add(character);
        }

        debug(_characters);

        _characterService.updateCharactersList(_characters);
      });
    }
  }
}
