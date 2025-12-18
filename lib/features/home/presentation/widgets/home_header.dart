import 'package:flutter/material.dart';
import '../../../../theme/app_text_styles.dart';
import '../../../../core/widgets/adaptive_layout.dart';
import '../../../../core/widgets/vertical_flip_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        // Estimate Left Column width (Time + Date)
        // 48px font size for time + some padding.
        // We'll be conservative and give the Right Column the remaining space.
        final leftColumnWidth = AdaptiveLayout.scale(context, 160);
        final rightColumnWidth =
            totalWidth - leftColumnWidth - AdaptiveLayout.scale(context, 16);

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center vertically to balance
          children: [
            // Left Column: Date and Time
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '12:45',
                  style: AppTextStyles.displayLarge.copyWith(
                    fontSize: AdaptiveLayout.scale(context, 48),
                  ),
                  textHeightBehavior: const TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                    applyHeightToLastDescent: false,
                  ),
                ),
                Text(
                  'Thursday, Dec 18',
                  style: AppTextStyles.titleMedium.copyWith(
                    fontSize: AdaptiveLayout.scale(context, 16),
                  ),
                  textHeightBehavior: const TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                    applyHeightToLastDescent: false,
                  ),
                ),
              ],
            ),

            // Right Column: 3 Adaptive Rows
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildStatRow(context, 'Unlocks', '14'),
                      SizedBox(height: AdaptiveLayout.scale(context, 12)),
                      _buildStatRow(context, 'Usage', '1h 2m'),
                      SizedBox(height: AdaptiveLayout.scale(context, 12)),
                    ],
                  ),
                  VerticalFlipText(
                    text:
                        'Stay focused. This is a very long sentence that should be split into appropriate parts and flipped upwards.',
                    maxWidth: rightColumnWidth,
                    style: AppTextStyles.labelSmall.copyWith(
                      fontSize: AdaptiveLayout.scale(context, 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatRow(BuildContext context, String label, String value) {
    final double fontSize = AdaptiveLayout.scale(context, 14);
    return RichText(
      textAlign: TextAlign.end,
      textHeightBehavior: const TextHeightBehavior(
        applyHeightToFirstAscent: false,
        applyHeightToLastDescent: false,
      ),
      text: TextSpan(
        style: AppTextStyles.labelSmall.copyWith(fontSize: fontSize),
        children: [
          TextSpan(text: '$label - '),
          TextSpan(
            text: value,
            style: AppTextStyles.labelMedium.copyWith(fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
