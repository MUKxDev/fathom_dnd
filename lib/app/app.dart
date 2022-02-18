import 'package:fathom_dnd/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:fathom_dnd/app/locator/locator.dart';
import 'package:fathom_dnd/app/services/app/router_service.dart';

class FathomDndApp extends StatelessWidget {
  const FathomDndApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RouterService _routerService = locator<RouterService>();

    return MaterialApp.router(
      title: "Fathom Dnd",
      debugShowCheckedModeBanner: false,
      routeInformationParser: _routerService.router.defaultRouteParser(),
      routerDelegate: _routerService.router.delegate(),
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
