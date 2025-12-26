import 'package:flutter/material.dart';
import 'package:return_zero/features/settings/widgets/common/settings_label.dart';

class SettingsRow extends StatelessWidget {
  final String label;
  final Widget? labelWidget;
  final Widget? control;
  const SettingsRow({super.key, required this.label, this.labelWidget, this.control});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if(labelWidget != null) labelWidget! else SettingsLabel(label),
        if (control != null) control!,
      ],
    );
  }
}