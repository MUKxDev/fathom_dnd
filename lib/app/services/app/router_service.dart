import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import "package:injectable/injectable.dart";
import "package:fathom_dnd/app/router/router.dart";

@lazySingleton
class RouterService {
  final FathomDndRouter router = FathomDndRouter();

  final GlobalKey<AutoRouterState> authKey = GlobalKey<AutoRouterState>();
  late StackRouter? authRouter = authKey.currentState?.controller;

  final GlobalKey<AutoRouterState> homeKey = GlobalKey<AutoRouterState>();
  late StackRouter? homeRouter = homeKey.currentState?.controller;
}
