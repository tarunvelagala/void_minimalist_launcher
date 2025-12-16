import 'package:flutter/material.dart';

class UsagePermissions extends StatelessWidget {
  /// Callback for when the user taps to grant permission.
  /// Usually calls [UsageUtils.grantPermission].
  final VoidCallback onTap;

  const UsagePermissions({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // HitTestBehavior.opaque ensures the padding area is also tappable
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Text(
          'Enable Stats',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
