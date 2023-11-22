import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:star_wars_ui/star_wars_ui.dart';

/// [StarWarsTheme] is a theme that can be used to style the UI of the app.
abstract class StarWarsTheme {
  static const FlexSchemeData _ogFlexScheme = FlexSchemeData(
    name: 'Star Wars theme',
    description: 'Star Wars theme, custom definition of all colors',
    light: FlexSchemeColor(
      primary: Palette.primary,
      primaryContainer: Palette.primary,
      secondary: Palette.secondary,
      secondaryContainer: Palette.secondary,
      tertiary: Palette.tertiary,
      tertiaryContainer: Palette.tertiary,
    ),
    dark: FlexSchemeColor(
      primary: Palette.primary,
      primaryContainer: Palette.primary,
      secondary: Palette.secondary,
      secondaryContainer: Palette.secondary,
      tertiary: Palette.tertiary,
      tertiaryContainer: Palette.tertiary,
    ),
  );

  static final ThemeData light = FlexThemeData.light(
    colors: _ogFlexScheme.light,
    scaffoldBackground: Palette.white,
  ).copyWith(
    appBarTheme: AppBarTheme(
      foregroundColor: Palette.black.withOpacity(.25),
      backgroundColor: Palette.white,
      titleTextStyle: _textTheme.titleLarge?.copyWith(
        color: Palette.black,
      ),
      centerTitle: true,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.light().copyWith(
      secondary: Palette.transparent,
    ),
    textTheme: _textTheme.copyWith(
      displayMedium: _textTheme.displayMedium?.copyWith(
        color: Palette.black,
      ),
      displaySmall: _textTheme.displaySmall?.copyWith(
        color: Palette.black,
      ),
      headlineSmall: _textTheme.headlineSmall?.copyWith(
        color: Palette.black,
      ),
      titleLarge: _textTheme.titleLarge?.copyWith(
        color: Palette.black,
      ),
      titleMedium: _textTheme.titleMedium?.copyWith(
        color: Palette.black,
      ),
      titleSmall: _textTheme.titleSmall?.copyWith(
        color: Palette.black,
      ),
      bodyLarge: _textTheme.bodyLarge?.copyWith(
        color: Palette.black,
      ),
      bodyMedium: _textTheme.bodyMedium?.copyWith(
        color: Palette.black,
      ),
      bodySmall: _textTheme.bodySmall?.copyWith(
        color: Palette.black,
      ),
      labelLarge: _textTheme.labelLarge?.copyWith(
        color: Palette.black,
      ),
      labelMedium: _textTheme.labelMedium?.copyWith(
        color: Palette.black,
      ),
      labelSmall: _textTheme.labelSmall?.copyWith(
        color: Palette.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(elevation: 0),
    ),
  );

  static final ThemeData dark = FlexThemeData.dark(
    colors: _ogFlexScheme.dark,
    scaffoldBackground: Palette.black,
  ).copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Palette.black,
      foregroundColor: Palette.black.withOpacity(.25),
      titleTextStyle: _textTheme.titleLarge,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    textTheme: _textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(elevation: 0),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      secondary: Palette.transparent,
    ),
  );

  /// [TextTheme] for the [light] theme, it uses 2021 set,
  /// 2018 will be deprecated.
  /// Source: https://github.com/flutter/flutter/pull/93725
  static TextTheme get _textTheme => TextTheme(
        displayMedium: AppTextStyle.displayMedium,
        displaySmall: AppTextStyle.displaySmall,
        headlineSmall: AppTextStyle.headlineSmall,
        titleLarge: AppTextStyle.titleLarge,
        titleMedium: AppTextStyle.titleMedium,
        titleSmall: AppTextStyle.titleSmall,
        bodyLarge: AppTextStyle.bodyLarge,
        bodyMedium: AppTextStyle.bodyMedium,
        bodySmall: AppTextStyle.bodySmall,
        labelLarge: AppTextStyle.labelLarge,
        labelMedium: AppTextStyle.labelMedium,
        labelSmall: AppTextStyle.labelSmall,
      );
}
