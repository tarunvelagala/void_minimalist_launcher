import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../core/widgets/adaptive_layout.dart';
import '../features/home/presentation/widgets/home_header.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Return Zero',
        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: AppColors.background,
          primaryColor: AppColors.background,
          textTheme: TextTheme(
            displayLarge: AppTextStyles.displayLarge,
            titleMedium: AppTextStyles.titleMedium,
            labelSmall: AppTextStyles.labelSmall,
            labelMedium: AppTextStyles.labelMedium,
            bodySmall: AppTextStyles.bodySmall,
          ),
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        home: const LauncherHome(),
      ),
    );
  }
}

class LauncherHome extends StatelessWidget {
  const LauncherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(children: [HomeHeader(), Spacer()]),
        ),
      ),
    );
  }
}
