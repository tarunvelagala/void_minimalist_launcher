import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:return_zero/core/theme/app_layout.dart';
import 'package:return_zero/features/settings/widgets/about/about_section.dart';
import 'package:return_zero/features/settings/widgets/controls/controls_section.dart';
import 'package:return_zero/features/settings/widgets/homeandlayout/home_and_layout_section.dart';
import 'package:return_zero/features/settings/widgets/lookandfeel/look_and_feel_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> settingsSections = [
      AboutSection(),
      HomeAndLayoutSection(),
      LookAndFeelSection(),
      ControlsSection(),
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
