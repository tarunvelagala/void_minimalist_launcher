import 'package:flutter/material.dart';
import 'package:return_zero/core/utils/formatter_utils.dart';
import 'package:return_zero/features/home/presentation/constants.dart';
import 'package:return_zero/features/home/presentation/widgets/nomos/at_a_glance.dart';
import 'package:return_zero/features/home/presentation/widgets/nomos/stat.dart';

class Nomos extends StatelessWidget {
  const Nomos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stat(label: 'Usage', value: FormatterUtils.formatDuration(10000)),
        const SizedBox(height: Constants.nomosVerticalSpacing),
        Stat(label: 'Unlocks', value: FormatterUtils.formatUnlocks('10000')),
        const SizedBox(height: Constants.nomosVerticalSpacing),
        // Placeholder for "At a glance" widget
        const AtAGlance(),
      ],
    );
  }
}
