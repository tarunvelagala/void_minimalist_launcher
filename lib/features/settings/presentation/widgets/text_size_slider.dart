import 'package:flutter/material.dart';

class TextSizeSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const TextSizeSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  String _getTextSizeLabel(double value) {
    if (value <= 0.8) return 'Small';
    if (value <= 1.0) return 'Normal';
    if (value <= 1.2) return 'Large';
    return 'Extra Large';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ListTile(
          title: Text('Text Size'),
          subtitle: Text('Adjust the size of text throughout the app'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _getTextSizeLabel(value),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${(value * 100).toInt()}%',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              Slider(
                value: value,
                min: 0.8,
                max: 1.4,
                divisions: 6,
                label: _getTextSizeLabel(value),
                onChanged: onChanged,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Small', style: Theme.of(context).textTheme.bodySmall),
                    Text(
                      'Extra Large',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
