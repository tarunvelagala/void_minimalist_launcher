import 'package:flutter/material.dart';

class Stat extends StatelessWidget {
  final String label;
  final String? value;
  final VoidCallback? onTap;
  final IconData? icon;

  const Stat({
    super.key,
    required this.label,
    this.value,
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

        /// Value OR action
        if (value != null)
          Text(value!, style: theme.textTheme.titleMedium)
        else
          TextButton.icon(
            onPressed: onTap,
            icon: Icon(icon ?? Icons.security, size: 14),
            label: Text('Enable', style: theme.textTheme.titleMedium),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
      ],
    );
  }
}
