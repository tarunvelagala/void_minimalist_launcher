import 'package:flutter/material.dart';
import 'package:return_zero/core/theme/app_typography.dart';

class HomeGlanceDisplay extends StatelessWidget {
  const HomeGlanceDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Glance", style: AppTypography.titleMedium(context));
  }
}
