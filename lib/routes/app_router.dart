import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:return_zero/features/home/homepage.dart';
import 'package:return_zero/features/home/widgets/settings/settings_page.dart';
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const Homepage(),
      routes: [
        GoRoute(
          path: AppRoutes.settings,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              opaque: true,
              child: const SettingsPage(),
              transitionsBuilder:
                  (
                    BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child,
                  ) {
                    return child;
                  },
            );
          },
        ),
      ],
    ),
  ],
);
