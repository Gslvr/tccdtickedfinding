import 'package:flutter/material.dart';

@immutable
final class AppTheme {
  const AppTheme._();

  /// [1] [Açık Tema]
  static final lightTheme = ThemeData(
    colorScheme: lightScheme,
  );

  /// [2] [Koyu Tema]
  static final darkTheme = ThemeData(
    colorScheme: darkScheme,
  );

  static ColorScheme get lightScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff000000),
        surfaceTint: Color(0xff006879),
        onPrimary: Color(0xff020202),
        primaryContainer: Color(0xffa9edff),
        onPrimaryContainer: Color(0xff001f26),
        secondary: Color(0xff4b6268),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xffcee7ee),
        onSecondaryContainer: Color(0xff061f24),
        tertiary: Color(0xff565d7e),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xffdde1ff),
        onTertiaryContainer: Color(0xff121a37),
        error: Color(0xffba1a1a),
        onError: Color(0xffffffff),
        errorContainer: Color(0xffffdad6),
        onErrorContainer: Color(0xff410002),
        surface: Color(0xfff5fafc),
        onSurface: Color(0xff171d1e),
        onSurfaceVariant: Color(0xff3f484b),
        outline: Color(0xff6f797b),
        outlineVariant: Color(0xffbfc8cb),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff2b3133),
        inversePrimary: Color(0xff84d2e6),
        primaryFixed: Color(0xffa9edff),
        onPrimaryFixed: Color(0xff001f26),
        primaryFixedDim: Color(0xff84d2e6),
        onPrimaryFixedVariant: Color(0xff004e5b),
        secondaryFixed: Color(0xffcee7ee),
        onSecondaryFixed: Color(0xff061f24),
        secondaryFixedDim: Color(0xffb2cbd2),
        onSecondaryFixedVariant: Color(0xff334a50),
        tertiaryFixed: Color(0xffdde1ff),
        onTertiaryFixed: Color(0xff121a37),
        tertiaryFixedDim: Color(0xffbec5eb),
        onTertiaryFixedVariant: Color(0xff3e4565),
        surfaceDim: Color(0xffd5dbdd),
        surfaceBright: Color(0xfff5fafc),
        surfaceContainerLowest: Color(0xffffffff),
        surfaceContainerLow: Color(0xffeff4f6),
        surfaceContainer: Color(0xffe9eff1),
        surfaceContainerHigh: Color(0xffe4e9eb),
        surfaceContainerHighest: Color(0xffdee3e5),
      );

  static ColorScheme get darkScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xffffffff),
        surfaceTint: Color(0xff84d2e6),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xff004e5b),
        onPrimaryContainer: Color(0xffa9edff),
        secondary: Color(0xffb2cbd2),
        onSecondary: Color(0xff1c343a),
        secondaryContainer: Color(0xff334a50),
        onSecondaryContainer: Color(0xffcee7ee),
        tertiary: Color(0xffbec5eb),
        onTertiary: Color(0xff282f4d),
        tertiaryContainer: Color(0xff3e4565),
        onTertiaryContainer: Color(0xffdde1ff),
        error: Color(0xffffb4ab),
        onError: Color(0xff690005),
        errorContainer: Color(0xff93000a),
        onErrorContainer: Color(0xffffdad6),
        surface: Color(0xff0f1416),
        onSurface: Color(0xffdee3e5),
        onSurfaceVariant: Color(0xffbfc8cb),
        outline: Color(0xff899295),
        outlineVariant: Color(0xff3f484b),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xffdee3e5),
        inversePrimary: Color(0xff006879),
        primaryFixed: Color(0xffa9edff),
        onPrimaryFixed: Color(0xff001f26),
        primaryFixedDim: Color(0xff84d2e6),
        onPrimaryFixedVariant: Color(0xff004e5b),
        secondaryFixed: Color(0xffcee7ee),
        onSecondaryFixed: Color(0xff061f24),
        secondaryFixedDim: Color(0xffb2cbd2),
        onSecondaryFixedVariant: Color(0xff334a50),
        tertiaryFixed: Color(0xffdde1ff),
        onTertiaryFixed: Color(0xff121a37),
        tertiaryFixedDim: Color(0xffbec5eb),
        onTertiaryFixedVariant: Color(0xff3e4565),
        surfaceDim: Color(0xff0f1416),
        surfaceBright: Color(0xff343a3c),
        surfaceContainerLowest: Color(0xff090f11),
        surfaceContainerLow: Color(0xff171d1e),
        surfaceContainer: Color(0xff1b2122),
        surfaceContainerHigh: Color(0xff252b2d),
        surfaceContainerHighest: Color(0xff303637),
      );
}
