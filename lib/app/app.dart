import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:return_zero/app/app_launcher.dart';
import 'package:return_zero/core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Return Zero',
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: Builder(
          builder: (context) {
            final brightness = MediaQuery.of(context).platformBrightness;
            return Theme(
              data: brightness == Brightness.dark
                  ? AppTheme.dark(context)
                  : AppTheme.light(context),
              child: child!,
            );
          },
        ),
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      themeMode: ThemeMode.system,
      home: const AppLauncher(),
    );
  }
}
