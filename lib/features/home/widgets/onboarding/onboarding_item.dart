import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.value, required this.index});

  final String value;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$index. $value",
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
