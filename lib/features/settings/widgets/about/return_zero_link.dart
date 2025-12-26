import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:return_zero/core/theme/app_typography.dart';

class ReturnZeroLink extends StatelessWidget {
  const ReturnZeroLink({super.key});

  @override
  Widget build(BuildContext context) {
    const String githubUrl = "https://github.com/tarunvelagala/return_zero";
    const String version = 'v1.0.0';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'App Version',
          style: AppTypography.titleMedium(
            context,
            scaleFactor: AppTypography.defaultScaleFactor,
          ),
        ),
        GestureDetector(
          onTap: () => _launchURL(githubUrl),
          child: Text(
            version,
            style: AppTypography.bodyMedium(
              context,
              scaleFactor: AppTypography.defaultScaleFactor,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
