import 'package:flutter/material.dart';
import 'package:return_zero/core/theme/app_layout.dart';
import 'package:return_zero/features/home/widgets/glance/glance_section.dart';
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Padding(
              padding: EdgeInsets.all(AppLayout.screenMargin(context)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomeHeaderSection(),
                  GlanceSection(),
                  HomeApps(),
                  OnboardingSection(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
