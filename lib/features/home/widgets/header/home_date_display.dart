import 'package:flutter/material.dart';
import 'package:return_zero/core/theme/app_typography.dart';

class HomeDateDisplay extends StatelessWidget {
  const HomeDateDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Fri, 19 Dec", style: AppTypography.dateDisplay(context));
  }
}
