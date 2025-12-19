import 'package:flutter/material.dart';

class HomeUsageDisplay extends StatelessWidget {
  const HomeUsageDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("Screen Usage", style: Theme.of(context).textTheme.titleMedium),
        Text("Unlocks", style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
