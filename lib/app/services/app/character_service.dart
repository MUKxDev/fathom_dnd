import 'package:fathom_dnd/app/models/character.dart';
import 'package:fathom_dnd/app/utils/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class CharacterService with ReactiveServiceMixin {
  /* -------------------------------------------------------------------------- */
  /*                                   Values                                   */
  /* -------------------------------------------------------------------------- */
  final ReactiveList<Character> _charactersList = ReactiveList<Character>();
  List<Character> get charactersList => _charactersList.toList();

  final ReactiveValue<Character?> _character = ReactiveValue<Character?>(null);
  Character? get character => _character.value;

  // final ReactiveValue<String?> _characterId = ReactiveValue<String?>(null);
  // String? get characterId => _characterId.value;

  /* -------------------------------------------------------------------------- */
  /*                                  Functions                                 */
  /* -------------------------------------------------------------------------- */
  updateCharactersList(List<Character> newCharactersList) {
    _charactersList.clear();
    _charactersList.addAll(newCharactersList);
    debug(_charactersList,
        'CharacterService => updateCharactersList => new List');
    notifyListeners();
  }

  updateCharacter(Character newCharacter) {
    _character.value = newCharacter;
    debug(_character.value, 'CharacterService => updateCharacter => new value');
    notifyListeners();
  }

  // updateCharacterId(String id) {
  //   _characterId.value = id;
  //   debug(
  //       _characterId.value, 'CharacterService => updateCharacterId => new id');
  //   notifyListeners();
  // }
}
