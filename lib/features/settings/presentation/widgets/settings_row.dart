import 'package:flutter/material.dart';

class SettingRow extends StatelessWidget {
  final String title;
  final Widget action;

  const SettingRow({super.key, required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // The "Key" (Label)
          Text(title, style: Theme.of(context).textTheme.bodyLarge),

          // The "Widget" (ChoiceToggle)
          action,
        ],
      ),
    );
  }
}
