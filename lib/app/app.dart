import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: false,

        textTheme: const TextTheme(
          // Time / Numbers
          displayLarge: TextStyle(
            fontFamily: 'SpaceMono',
            fontSize: 48,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),

          // Stats (screen time, unlocks)
          titleMedium: TextStyle(
            fontFamily: 'SpaceMono',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white70,
          ),

          // Dynamic text / labels
          bodyMedium: TextStyle(
            fontFamily: 'DarkerGrotesque',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white70,
          ),
        ),

        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),

      home: const LauncherHome(),
    );
  }
}

class LauncherHome extends StatelessWidget {
  const LauncherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: SizedBox.expand()),
    );
  }
}
