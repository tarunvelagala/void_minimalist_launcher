import 'package:flutter/material.dart';
import 'package:return_zero/core/utils/formatter_utils.dart';
import 'package:return_zero/features/home/presentation/constants.dart';

class Stat extends StatelessWidget {
  final String label;
  final String value;
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: theme.textTheme.labelMedium),
        const SizedBox(width: Constants.nomosStatHorizontalSpacing),
        Text(
          FormatterUtils.formatUnlocks(value),
          style: theme.textTheme.titleSmall,
        ),
      ],
    );
  }
}
