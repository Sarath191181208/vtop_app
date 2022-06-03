import 'package:flutter/material.dart';

import 'storage/pref_theme.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.textColor,
    required this.boxColor,
  });

  final Color? textColor;
  final Color? boxColor;

  @override
  MyColors copyWith({Color? textColor, Color? boxColor}) {
    return MyColors(
      textColor: textColor ?? this.textColor,
      boxColor: boxColor ?? this.boxColor,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      textColor: Color.lerp(textColor, other.textColor, t),
      boxColor: Color.lerp(boxColor, other.boxColor, t),
    );
  }

  // Optional
  @override
  String toString() => 'MyColors(textColor: $textColor, boxColor: $boxColor)';
}

const Color primaryColor = Color.fromRGBO(243, 33, 138, 1);

class ThemeNotifier with ChangeNotifier {
  // create a theme with custom colors;
  final darkTheme = ThemeData(
    primaryColor: primaryColor,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primaryColor,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryColor,
      circularTrackColor: Color.fromRGBO(205, 205, 205, 0.5),
    ),
    dividerColor: const Color.fromRGBO(200, 200, 200, 0.122),
    brightness: Brightness.dark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: primaryColor,
      unselectedItemColor: primaryColor.withOpacity(0.5),
    ),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: Colors.black,
        actionTextColor: Colors.grey,
        contentTextStyle: TextStyle(color: Colors.white)),
    backgroundColor: Colors.black,
  ).copyWith(extensions: <ThemeExtension<dynamic>>[
    const MyColors(
      textColor: Colors.white,
      boxColor: Colors.black,
    ),
  ]);

  final lightTheme = ThemeData(
    primaryColor: primaryColor,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primaryColor,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryColor,
      circularTrackColor: Color.fromRGBO(205, 205, 205, 0.5),
    ),
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: primaryColor.withOpacity(0.3),
    ),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: Colors.white,
        actionTextColor: Colors.grey,
        contentTextStyle: TextStyle(color: Colors.black)),
    dividerColor: Colors.black12,
  ).copyWith(extensions: <ThemeExtension<dynamic>>[
    const MyColors(
      textColor: Colors.white,
      boxColor: Colors.white,
    ),
  ]);

  bool _isDarkTheme = false;

  ThemeData getTheme() => _isDarkTheme ? darkTheme : lightTheme;

  ThemeNotifier() {
    var isDark = PrefTheme.isDark();
    isDark.then((value) {
      _isDarkTheme = value;
      notifyListeners();
    });
  }

  toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    PrefTheme.saveTheme(_isDarkTheme);
    notifyListeners();
  }
}
