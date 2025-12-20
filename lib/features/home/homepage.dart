import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:return_zero/core/theme/app_layout.dart';
import 'package:return_zero/features/home/widgets/glance/glance_section.dart';
import 'package:return_zero/routes/app_routes.dart';
import 'widgets/header/home_header_section.dart';
import 'widgets/home_apps.dart';
import 'widgets/onboarding/onboarding_section.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => context.go(AppRoutes.settings),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: OrientationBuilder(
            builder: (context, orientation) {
              return Padding(
                padding: EdgeInsets.all(AppLayout.screenMargin(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: AppLayout.flexMedium(context),
                      child: const HomeHeaderSection(),
                    ),
                    Expanded(
                      flex: AppLayout.flexSmall(context),
                      child: const GlanceSection(),
                    ),
                    Expanded(
                      flex: AppLayout.flexLarge(context),
                      child: const HomeApps(),
                    ),
                    Expanded(
                      flex: AppLayout.flexSmall(context),
                      child: const OnboardingSection(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
