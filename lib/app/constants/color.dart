part of 'constants.dart';

const primary = Color(0xff8B41D2);
const accent = Color(0xffEBF1FF);
const darkBlue = Color(0xff1B2255);
const white = Color(0xffFFFFFF);

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
    appBarTheme: const AppBarTheme(backgroundColor: primary));
