import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:return_zero/core/theme/app_layout.dart';
import 'package:return_zero/features/home/widgets/settings/settings_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              itemCount: 4,
              itemBuilder: (context, index) {
                return const SettingsPageSection();
              },
            ),
          );
        },
      ),
    );
  }
}
