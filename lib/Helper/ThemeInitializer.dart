import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gohar_shahi/main.dart';



// Function to toggle theme mode
void toggleTheme() {
  final brightness = getbrightness();

  themeNotifier.value = brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
  setSystemNavigationBarColor();
}


Brightness getbrightness() {
  final brightness =
      themeNotifier.value == ThemeMode.system
          ? WidgetsBinding.instance.platformDispatcher.platformBrightness
          : (themeNotifier.value == ThemeMode.dark
              ? Brightness.dark
              : Brightness.light);

  return brightness;
}

void setSystemNavigationBarColor() {
  final brightness = getbrightness();

  final isDark = brightness == Brightness.dark;

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: isDark ? Color.fromARGB(255, 22, 13, 13) : Color.fromARGB(255, 253, 245, 246),
      systemNavigationBarIconBrightness:
          isDark ? Brightness.light : Brightness.dark,
    ),
  );
}
