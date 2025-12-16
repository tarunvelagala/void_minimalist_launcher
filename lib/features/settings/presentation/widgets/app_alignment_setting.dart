import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppAlignmentSetting extends StatelessWidget {
  final CrossAxisAlignment currentAlignment;
  final ValueChanged<CrossAxisAlignment> onSelectionChanged;

  const AppAlignmentSetting({
    super.key,
    required this.currentAlignment,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('App Alignment'),
      subtitle: Text(
        'Position content to the edge or center',
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: SegmentedButton<CrossAxisAlignment>(
        showSelectedIcon: false,
        segments: const [
          ButtonSegment(value: CrossAxisAlignment.start, label: Text('Left')),
          ButtonSegment(
            value: CrossAxisAlignment.center,
            label: Text('Center'),
          ),
          ButtonSegment(value: CrossAxisAlignment.end, label: Text('Right')),
        ],
        selected: {currentAlignment},
        onSelectionChanged: (Set<CrossAxisAlignment> newSelection) {
          // Haptic feedback provides a tactile feel to the alignment shift
          HapticFeedback.lightImpact();
          onSelectionChanged(newSelection.first);
        },
        style: SegmentedButton.styleFrom(
          visualDensity: VisualDensity.compact,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
    );
  }
}
