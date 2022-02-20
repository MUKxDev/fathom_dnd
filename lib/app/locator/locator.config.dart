// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../services/api/auth_service.dart' as _i3;
import '../services/api/fathom_dnd_service.dart' as _i5;
import '../services/api/firestore_service.dart' as _i6;
import '../services/app/character_service.dart' as _i4;
import '../services/app/router_service.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AuthService>(() => _i3.AuthService());
  gh.lazySingleton<_i4.CharacterService>(() => _i4.CharacterService());
  gh.lazySingleton<_i5.FathomDndService>(() => _i5.FathomDndService());
  gh.lazySingleton<_i6.FirestoreService>(() => _i6.FirestoreService());
  gh.lazySingleton<_i7.RouterService>(() => _i7.RouterService());
  return get;
}
