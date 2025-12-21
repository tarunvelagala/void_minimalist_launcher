import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:return_zero/core/theme/app_layout.dart';
import 'package:return_zero/features/home/widgets/settings/about_section.dart';
import 'package:return_zero/features/home/widgets/settings/controls.dart';
import 'package:return_zero/features/home/widgets/settings/home_and_layout.dart';
import 'package:return_zero/features/home/widgets/settings/look_and_feel.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> settingsSections = [
      AboutSection(),
      HomeAndLayout(),
      LookAndFeel(),
      Controls(),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Padding(
            padding: EdgeInsets.all(AppLayout.screenMargin(context)),
            child: MasonryGridView.count(
              crossAxisCount: AppLayout.settingsColumnCount(context),
              mainAxisSpacing: AppLayout.sectionSpacing(context),
              crossAxisSpacing: AppLayout.sectionSpacing(context),
              itemCount: settingsSections.length,
              itemBuilder: (context, index) {
                return settingsSections[index];
              },
            ),
          );
        },
      ),
    );
  }
}
