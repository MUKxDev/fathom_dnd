import 'package:fathom_dnd/app/services/api/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:fathom_dnd/app/core/custom_base_view_model.dart';
import 'package:fathom_dnd/app/locator/locator.dart';
import 'package:fathom_dnd/app/router/router.dart';
import 'package:fathom_dnd/app/services/app/router_service.dart';

class StartupViewModel extends CustomBaseViewModel {
  /* -------------------------------------------------------------------------- */
  /*                                  Services                                  */
  /* -------------------------------------------------------------------------- */
  final RouterService _routerService = locator<RouterService>();
  final AuthService _authService = locator<AuthService>();

  Future<void> init() async {
    WidgetsBinding.instance!.addPostFrameCallback((Duration duration) async {
      if (_authService.stackedAuth.hasUser) {
        await navigateToHomeView();
      } else {
        await navigateToAuthView();
      }
    });
  }

  Future navigateToAuthView() async {
    await _routerService.router.navigate(
      const AuthParentRoute(),
    );
  }

  Future navigateToHomeView() async {
    await _routerService.router.navigate(
      const HomeRoute(),
    );
  }
}
