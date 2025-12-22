import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:return_zero/core/theme/app_layout.dart';
import 'package:return_zero/routes/app_routes.dart';

class AppDrawerPage extends StatelessWidget {
  const AppDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          context.go(AppRoutes.home);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: OrientationBuilder(
          builder: (context, orientation) {
            return Padding(
              padding: EdgeInsets.all(AppLayout.screenMargin(context)),
              child: Placeholder(),
            );
          },
        ),
      ),
    );
  }
}
