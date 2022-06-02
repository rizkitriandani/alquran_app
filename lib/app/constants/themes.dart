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
    tabBarTheme: TabBarTheme(
      labelColor: primary,
      unselectedLabelColor: inactiveColor,
      labelStyle: basedFont.copyWith(fontSize: 16),
      indicator: const ShapeDecoration(
        shape: UnderlineInputBorder(
            borderSide:
                BorderSide(color: primary, width: 3, style: BorderStyle.solid)),
        // gradient: LinearGradient(colors: [Color(0xff0081ff), Color(0xff01ff80)])
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      titleTextStyle: textTheme.headline1!.copyWith(fontSize: 20, color: white),
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
    textTheme: textThemeDark,
    tabBarTheme: TabBarTheme(
      labelColor: primary,
      unselectedLabelColor: inactiveColor,
      labelStyle: basedFont.copyWith(fontSize: 16),
      indicator: const ShapeDecoration(
        shape: UnderlineInputBorder(
            borderSide:
                BorderSide(color: primary, width: 3, style: BorderStyle.solid)),
        // gradient: LinearGradient(colors: [Color(0xff0081ff), Color(0xff01ff80)])
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: textTheme.headline1!.copyWith(fontSize: 20, color: white),
    ));
