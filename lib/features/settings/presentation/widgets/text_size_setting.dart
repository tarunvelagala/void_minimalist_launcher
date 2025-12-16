import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextSizeSetting extends StatelessWidget {
  final double currentFactor;
  final ValueChanged<double> onSelectionChanged;

  const TextSizeSetting({
    super.key,
    required this.currentFactor,
    required this.onSelectionChanged,
  });

  /// Helper to convert the double value into a human-readable string
  String _getTextSizeLabel(double value) {
    if (value <= 0.8) return 'Small';
    if (value <= 1.0) return 'Normal';
    if (value <= 1.2) return 'Large';
    return 'Extra Large';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Text Size'),
      subtitle: Text(
        _getTextSizeLabel(currentFactor),
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: SegmentedButton<double>(
        showSelectedIcon: false,
        segments: const [
          ButtonSegment(value: 0.8, label: Text('Small')),
          ButtonSegment(value: 1.0, label: Text('Normal')),
          ButtonSegment(value: 1.2, label: Text('Large')),
        ],
        selected: {currentFactor},
        onSelectionChanged: (Set<double> newSelection) {
          // Provide tactile feedback for a premium launcher feel
          HapticFeedback.lightImpact();
          onSelectionChanged(newSelection.first);
        },
        style: SegmentedButton.styleFrom(
          visualDensity: VisualDensity.compact,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }
}
