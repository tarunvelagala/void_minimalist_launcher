import 'package:flutter/material.dart';

class Stat extends StatelessWidget {
  final String label;
  final String? value;
  final VoidCallback? onTap;
  final IconData? icon;

  const Stat({
    super.key,
    required this.label,
    required this.value,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: theme.textTheme.labelMedium),
        const SizedBox(width: 6),
        Text(value!, style: theme.textTheme.titleMedium),
      ],
    );
  }
}
