// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:fathom_dnd/ui/views/auth_parent/auth_parent_view.dart' as _i3;
import 'package:fathom_dnd/ui/views/auth_parent/pages/login/login_view.dart'
    as _i7;
import 'package:fathom_dnd/ui/views/auth_parent/pages/sign_up/sign_up_view.dart'
    as _i8;
import 'package:fathom_dnd/ui/views/home/home_view.dart' as _i2;
import 'package:fathom_dnd/ui/views/home/pages/character_selection/character_selection_view.dart'
    as _i5;
import 'package:fathom_dnd/ui/views/home/pages/dashboard/dashboard_view.dart'
    as _i6;
import 'package:fathom_dnd/ui/views/new_character/new_character_view.dart'
    as _i4;
import 'package:fathom_dnd/ui/views/startup/startup_view.dart' as _i1;
import 'package:flutter/material.dart' as _i10;

class FathomDndRouter extends _i9.RootStackRouter {
  FathomDndRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.StartupView());
    },
    HomeRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.HomeView());
    },
    AuthParentRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.AuthParentView());
    },
    NewCharacterRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.NewCharacterView());
    },
    CharacterSelectionRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.CharacterSelectionView());
    },
    DashboardRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.DashboardView());
    },
    LoginRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.LoginView());
    },
    SignUpRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.SignUpView());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(StartupRoute.name, path: '/'),
        _i9.RouteConfig(HomeRoute.name, path: '/home-view', children: [
          _i9.RouteConfig(CharacterSelectionRoute.name,
              path: '', parent: HomeRoute.name),
          _i9.RouteConfig(DashboardRoute.name,
              path: 'dashboard-view', parent: HomeRoute.name)
        ]),
        _i9.RouteConfig(AuthParentRoute.name,
            path: '/auth-parent-view',
            children: [
              _i9.RouteConfig(LoginRoute.name,
                  path: '', parent: AuthParentRoute.name),
              _i9.RouteConfig(SignUpRoute.name,
                  path: 'sign-up-view', parent: AuthParentRoute.name)
            ]),
        _i9.RouteConfig(NewCharacterRoute.name, path: '/new-character-view')
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupRoute extends _i9.PageRouteInfo<void> {
  const StartupRoute() : super(StartupRoute.name, path: '/');

  static const String name = 'StartupRoute';
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home-view', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.AuthParentView]
class AuthParentRoute extends _i9.PageRouteInfo<void> {
  const AuthParentRoute({List<_i9.PageRouteInfo>? children})
      : super(AuthParentRoute.name,
            path: '/auth-parent-view', initialChildren: children);

  static const String name = 'AuthParentRoute';
}

/// generated route for
/// [_i4.NewCharacterView]
class NewCharacterRoute extends _i9.PageRouteInfo<void> {
  const NewCharacterRoute()
      : super(NewCharacterRoute.name, path: '/new-character-view');

  static const String name = 'NewCharacterRoute';
}

/// generated route for
/// [_i5.CharacterSelectionView]
class CharacterSelectionRoute extends _i9.PageRouteInfo<void> {
  const CharacterSelectionRoute()
      : super(CharacterSelectionRoute.name, path: '');

  static const String name = 'CharacterSelectionRoute';
}

/// generated route for
/// [_i6.DashboardView]
class DashboardRoute extends _i9.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: 'dashboard-view');

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i7.LoginView]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i8.SignUpView]
class SignUpRoute extends _i9.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: 'sign-up-view');

  static const String name = 'SignUpRoute';
}
