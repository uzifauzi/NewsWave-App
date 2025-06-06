import 'package:flutter/material.dart';
import 'package:newswave_app/core/injection.dart';
import 'package:newswave_app/presentation/pages/navigation_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:newswave_app/style/theme/news_theme.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsWave',
      theme: NewsTheme.lightTheme,
      darkTheme: NewsTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const NavigationPage(),
    );
  }
}
