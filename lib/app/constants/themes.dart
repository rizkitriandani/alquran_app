part of 'constants.dart';

ThemeData light = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      secondary: accent,
      surface: Colors.white,
      background: accent,
      error: Colors.red,
      onBackground: Colors.white,
      onError: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: darkBlue,
    ),
    visualDensity: VisualDensity.standard,
    canvasColor: accent,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      titleTextStyle: textTheme.headline1!.copyWith(
        fontSize: 24,color: white
      ),
      ));

ThemeData dark = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primary,
      secondary: accentDark,
      surface: Colors.white,
      background: accentDark,
      error: Colors.red,
      onBackground: Colors.white,
      onError: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: darkBlue,
    ),
    visualDensity: VisualDensity.standard,
    canvasColor: accentDark,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      titleTextStyle: textTheme.headline1!.copyWith(fontSize: 24),
    ));
