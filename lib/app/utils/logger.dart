import 'dart:developer';

import 'package:logger/logger.dart';

void debug(dynamic message, [String? name, dynamic error]) {
  AnsiColor? color = PrettyPrinter.levelColors[Level.debug];
  String? emoji = PrettyPrinter.levelEmojis[Level.debug];
  log(
    color!(
      '$emoji $message',
    ),
    name: name ?? 'debug',
    error: error,
    time: DateTime.now(),
  );
}

Logger getLogger(String name) {
  return Logger(
    printer: SimpleLogPrinter(
      name,
    ),
  );
}

class SimpleLogPrinter extends LogPrinter {
  final String name;

  SimpleLogPrinter(
    this.name,
  );

  @override
  List<String> log(LogEvent event) {
    AnsiColor? color = PrettyPrinter.levelColors[event.level];
    String? emoji = PrettyPrinter.levelEmojis[event.level];
    // ignore: avoid_print
    print(
      color!(
        '$emoji $name - ${event.message}',
      ),
    );

    return [];
  }
}
