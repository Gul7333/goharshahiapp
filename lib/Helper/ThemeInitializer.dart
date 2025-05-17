import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gohar_shahi/main.dart';



// Function to toggle theme mode
void toggleTheme() {
  final brightness = getbrightness();

  themeNotifier.value =
      brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;

  // setting bottom nav
  final isDark = brightness == Brightness.dark;

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: isDark ? Color(0xFF2C1A1A) : Color(0xFFE8F0FF),
      systemNavigationBarIconBrightness:
          isDark ? Brightness.light : Brightness.dark,
    ),
  );

  // _setSystemNavigationBarColor();
}

void setTheme(){
    final brightness = getbrightness();

    final isDark = brightness == Brightness.dark;

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: isDark ? Color(0xFF2C1A1A) : Color(0xFFFFEBEE),
      systemNavigationBarIconBrightness:
          isDark ? Brightness.light : Brightness.dark,
    ),
  );
  themeNotifier.value =
      brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;

}


Brightness getbrightness() {
  // final brightness =
  //     themeNotifier.value == ThemeMode.system
  //         ? WidgetsBinding.instance.platformDispatcher.platformBrightness
  //         : (themeNotifier.value == ThemeMode.dark
  //             ? Brightness.dark
  //             : Brightness.light);
final brightness = themeNotifier.value == ThemeMode.light ? Brightness.light : Brightness.dark;
  return brightness;
}

void setSystemNavigationBarColor() {
  final brightness = getbrightness();

  final isDark = brightness == Brightness.dark;

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: isDark ? Color(0xFF1C2238) : Color(0xFFE8F0FF),
      systemNavigationBarIconBrightness:
          isDark ? Brightness.light : Brightness.dark,
    ),
  );
}
