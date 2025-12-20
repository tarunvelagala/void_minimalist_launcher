import 'package:flutter/widgets.dart';
import 'onboarding_constants.dart';
import 'onboarding_item.dart';

class OnboardingSection extends StatelessWidget {
  const OnboardingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          OnboardingConstants.instructions.length,
          (index) => OnboardingItem(
            index: index + 1,
            value: OnboardingConstants.instructions[index],
          ),
        ),
      ),
    );
  }
}
