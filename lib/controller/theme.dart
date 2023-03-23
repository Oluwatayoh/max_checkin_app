import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    brightness: Brightness.dark,
    shadowColor: Colors.white,
    dividerColor: Colors.grey.shade800,
    scaffoldBackgroundColor: Colors.black12,
    cardColor: Colors.grey.shade700,
    // primaryColorDark: Colors.black,
    buttonColor: Colors.yellow,
    canvasColor: Colors.black,
    primaryColor: Colors.grey.shade700,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.yellow, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    brightness: Brightness.light,
    backgroundColor: Color.fromARGB(255, 247, 247, 247),
    dividerColor: Colors.black12,
    cardColor: Colors.white,
    // primaryColorLight: Colors.blueAccent,
    canvasColor: Colors.yellow,
    buttonColor: Colors.white,
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.grey.shade600),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.yellow, opacity: 0.8),

    shadowColor: Colors.white,
  );
}
