import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:fathom_dnd/app/app.dart';
import 'package:fathom_dnd/app/locator/locator.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initFirebase();

  /// Sets logging level
  Logger.level = Level.debug;

  /// Register all the models and services before the app starts
  setupLocator();

  /// Runs the app :)
  runApp(const FathomDndApp());
}

_initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
