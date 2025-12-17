import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:return_zero/features/settings/presentation/constants.dart';

class ChoiceOption<T> {
  final String label;
  final T value;

  ChoiceOption(this.label, this.value);
}

class ChoiceToggle<T> extends StatelessWidget {
  final T selectedValue;
  final List<ChoiceOption<T>> options;
  final ValueChanged<T> onSelected;

  const ChoiceToggle({
    super.key,
    required this.selectedValue,
    required this.options,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: options.map((option) {
        final isSelected = selectedValue == option.value;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                if (!isSelected) {
                  HapticFeedback.selectionClick();
                  onSelected(option.value);
                }
              },
              child: AnimatedDefaultTextStyle(
                duration: Constants.toggleAnimationDuration,
                curve: Curves.easeInOut,
                style: TextStyle(
                  // Clean typography logic
                  fontWeight: isSelected
                      ? Theme.of(context).textTheme.titleMedium?.fontWeight
                      : Theme.of(context).textTheme.bodySmall?.fontWeight,
                  color: isSelected
                      ? Theme.of(context).textTheme.titleMedium?.color
                      : Theme.of(context).textTheme.bodySmall?.color,
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Constants.toggleHorizontalPadding,
                    vertical: Constants.toggleVerticalPadding,
                  ),
                  child: Text(option.label),
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
