enum LogLevels {
  info,
  warning,
  error,
}

class Logger {
  Logger._privateConstructor();
  static final Logger instance = Logger._privateConstructor();

  void log(LogLevels level, String message) {
    print(level.name + ' >_ ' + message);
  }
}
