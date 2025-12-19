import 'package:flutter/widgets.dart';
import 'package:return_zero/core/theme/app_layout.dart';
import 'package:return_zero/features/home/widgets/onboarding/onboarding_constants.dart';
import 'package:return_zero/features/home/widgets/onboarding/onboarding_item.dart';

class OnboardingInstructions extends StatelessWidget {
  const OnboardingInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: AppLayout.instructionsFlex(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: OnboardingConstants.instructions.indexed
            .map((e) => OnboardingItem(index: e.$1 + 1, value: e.$2))
            .toList(),
      ),
    );
  }
}
