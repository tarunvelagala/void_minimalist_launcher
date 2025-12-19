import 'package:flutter/widgets.dart';
import 'package:return_zero/core/theme/app_layout.dart';

class HomeApps extends StatelessWidget {
  const HomeApps({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: AppLayout.appsFlex(context),
      child: const Placeholder(),
    );
  }
}
