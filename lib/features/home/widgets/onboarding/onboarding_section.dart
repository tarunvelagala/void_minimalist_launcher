import 'package:flutter/widgets.dart';
import 'package:return_zero/core/theme/app_layout.dart';
import 'onboarding_constants.dart';
import 'onboarding_item.dart';

class OnboardingSection extends StatelessWidget {
  const OnboardingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: AppLayout.instructionsFlex(context),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            OnboardingConstants.instructions.length,
            (index) => OnboardingItem(
              index: index + 1,
              value: OnboardingConstants.instructions[index],
            ),
          ),
        ),
      ),
    );
  }
}
