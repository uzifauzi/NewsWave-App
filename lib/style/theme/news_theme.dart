import 'package:flutter/material.dart';

import '../typography/news_text_styles.dart';

class NewsTheme {
  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: NewsTextStyles.displayLarge,
      displayMedium: NewsTextStyles.displayMedium,
      displaySmall: NewsTextStyles.displaySmall,
      headlineLarge: NewsTextStyles.headlineLarge,
      headlineMedium: NewsTextStyles.headlineMedium,
      headlineSmall: NewsTextStyles.headlineSmall,
      titleLarge: NewsTextStyles.titleLarge,
      titleMedium: NewsTextStyles.titleMedium,
      titleSmall: NewsTextStyles.titleSmall,
      bodyLarge: NewsTextStyles.bodyLargeBold,
      bodyMedium: NewsTextStyles.bodyLargeMedium,
      bodySmall: NewsTextStyles.bodyLargeRegular,
      labelLarge: NewsTextStyles.labelLarge,
      labelMedium: NewsTextStyles.labelMedium,
      labelSmall: NewsTextStyles.labelSmall,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      //  colorSchemeSeed: TourismColors.blue.color,
      brightness: Brightness.light,
      textTheme: _textTheme,
      useMaterial3: true,
      //  appBarTheme: _appBarTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      //  colorSchemeSeed: TourismColors.blue.color,
      brightness: Brightness.dark,
      textTheme: _textTheme,
      useMaterial3: true,
      //  appBarTheme: _appBarTheme,
    );
  }
}
