import 'package:flutter/material.dart';
import 'package:return_zero/core/theme/app_layout.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Padding(
              padding: EdgeInsets.all(AppLayout.screenMargin(context)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Settings',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
