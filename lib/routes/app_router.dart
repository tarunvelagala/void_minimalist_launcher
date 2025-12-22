import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:return_zero/features/app_drawer/app_drawer_page.dart';
import 'package:return_zero/features/home/homepage.dart';
import 'package:return_zero/features/settings/settings_page.dart';
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
        GoRoute(
          path: AppRoutes.appDrawer,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              opaque: true,
              child: const AppDrawerPage(),
              transitionsBuilder:
                  (
                    BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child,
                  ) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;

                    var tween = Tween(
                      begin: begin,
                      end: end,
                    ).chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
            );
          },
        ),
      ],
    ),
  ],
);
