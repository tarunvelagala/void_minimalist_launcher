import 'package:flutter/material.dart';
import 'package:return_zero/features/home/homepage.dart';

class AppLauncher extends StatefulWidget {
  const AppLauncher({super.key});

  @override
  State<AppLauncher> createState() => _AppLauncherState();
}

class _AppLauncherState extends State<AppLauncher> {
  @override
  Widget build(BuildContext context) {
    return const Homepage();
  }
}
