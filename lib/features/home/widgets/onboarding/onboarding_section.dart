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
      child: ListView.builder(
        itemCount: OnboardingConstants.instructions.length,
        itemBuilder: (context, index) {
          return OnboardingItem(
            index: index + 1,
            value: OnboardingConstants.instructions[index],
          );
        },
      ),
    );
  }
}
