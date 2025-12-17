import 'package:flutter/material.dart';

class SettingSection extends StatelessWidget {
  final String header;
  final List<Widget> children;

  const SettingSection({
    super.key,
    required this.header,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header, style: Theme.of(context).textTheme.titleLarge),
        ...children,
      ],
    );
  }
}
