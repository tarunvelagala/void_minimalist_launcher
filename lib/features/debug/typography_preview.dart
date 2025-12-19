import 'package:flutter/material.dart';
import '../../core/constants/debug_design_system.dart';

class TypographyPreview extends StatelessWidget {
  const TypographyPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Typography Preview',
          style: AppTypography.titleLarge,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Sans-Serif (Darker Grotesque)'),
            _buildStyleRow(
              'Display Large',
              '12:40',
              AppTypography.displayLarge,
            ),
            _buildStyleRow(
              'Display Medium',
              'Display Medium',
              AppTypography.displayMedium,
            ),
            _buildStyleRow(
              'Display Small',
              'Display Small',
              AppTypography.displaySmall,
            ),
            _buildStyleRow(
              'Headline Large',
              'Headline Large',
              AppTypography.headlineLarge,
            ),
            _buildStyleRow(
              'Headline Medium',
              'Headline Medium',
              AppTypography.headlineMedium,
            ),
            _buildStyleRow(
              'Headline Small',
              'Headline Small',
              AppTypography.headlineSmall,
            ),
            _buildStyleRow(
              'Title Large',
              'Title Large',
              AppTypography.titleLarge,
            ),
            _buildStyleRow(
              'Title Medium',
              'Title Medium',
              AppTypography.titleMedium,
            ),
            _buildStyleRow(
              'Title Small',
              'Title Small',
              AppTypography.titleSmall,
            ),
            _buildStyleRow(
              'Body Large',
              'Body Large - The quick brown fox jumps over the lazy dog.',
              AppTypography.bodyLarge,
            ),
            _buildStyleRow(
              'Body Medium',
              'Body Medium - The quick brown fox jumps over the lazy dog.',
              AppTypography.bodyMedium,
            ),
            _buildStyleRow(
              'Body Small',
              'Body Small - The quick brown fox jumps over the lazy dog.',
              AppTypography.bodySmall,
            ),
            _buildStyleRow(
              'Label Large',
              'LABEL LARGE',
              AppTypography.labelLarge,
            ),
            _buildStyleRow(
              'Label Medium',
              'LABEL MEDIUM',
              AppTypography.labelMedium,
            ),
            _buildStyleRow(
              'Label Small',
              'LABEL SMALL',
              AppTypography.labelSmall,
            ),

            const SizedBox(height: 40),
            _buildSectionHeader('Monospace (Space Mono)'),
            _buildStyleRow('Mono Display', '1h 40m', AppTypography.monoDisplay),
            _buildStyleRow(
              'Mono Body',
              'usage_stats_service.dart',
              AppTypography.monoBody,
            ),
            _buildStyleRow(
              'Mono Label',
              'UNLOCKS: 42',
              AppTypography.monoLabel,
            ),

            const SizedBox(height: 40),
            _buildSectionHeader('Combined Styles'),

            // Clock Example
            _buildCombinedStyleRow(
              'Clock Mockup',
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '12:40',
                    style: AppTypography.clockPrimary.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'PM',
                    style: AppTypography.clockSuffix.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // Date Example
            _buildCombinedStyleRow(
              'Date Mockup',
              Text(
                'Fri, 19 Dec',
                style: AppTypography.dateStyle.copyWith(color: Colors.white),
              ),
            ),

            // Stat Example
            _buildCombinedStyleRow(
              'Stat Card Mockup',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2h 15m',
                    style: AppTypography.statValue.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'SCREEN TIME',
                    style: AppTypography.statLabel.copyWith(
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),

            _buildCombinedStyleRow(
              'Stat Card Mockup',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '42',
                    style: AppTypography.statValue.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'UNLOCKS',
                    style: AppTypography.statLabel.copyWith(
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),

            // Rich Text Example
            _buildCombinedStyleRow(
              'Rich Text / Inline Mono',
              RichText(
                text: AppTypography.combined(
                  text: 'The process ID is ',
                  monoPart: 'PID_4096',
                  baseStyle: AppTypography.bodyMedium.copyWith(
                    color: Colors.white,
                  ),
                  monoStyle: AppTypography.monoBody.copyWith(
                    color: Colors.amberAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.headlineMedium.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(color: Colors.white24),
        ],
      ),
    );
  }

  Widget _buildStyleRow(String label, String sample, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTypography.labelSmall.copyWith(
              color: Colors.white54,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 8),
          Text(sample, style: style.copyWith(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildCombinedStyleRow(String label, Widget preview) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTypography.labelSmall.copyWith(
              color: Colors.white54,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 12),
          preview,
        ],
      ),
    );
  }
}
