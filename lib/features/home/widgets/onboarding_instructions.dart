import 'package:flutter/widgets.dart';
import 'package:return_zero/core/theme/app_layout.dart';

class OnboardingInstructions extends StatelessWidget {
  const OnboardingInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: AppLayout.instructionsFlex(context),
      child: const Placeholder(),
    );
  }
}
