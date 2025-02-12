import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/home_page.dart';
import 'package:laqueadura_app/ui/laws/laws_page.dart';
import 'package:laqueadura_app/ui/operativeCare/operative_care_page.dart';
import 'package:laqueadura_app/ui/questions/questions_page.dart';
import 'package:laqueadura_app/ui/splash_page.dart';
import 'package:laqueadura_app/ui/steps_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laqueadura App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "QuickSand",
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffCD5E91)),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        '/steps': (context) => const StepPage(),
        '/operativeCare': (context) => const OperativeCarePage(),
        '/laws': (context) => const LawsPage(),
        '/question': (context) => const QuestionsPage(),
      },
    );
  }
}
