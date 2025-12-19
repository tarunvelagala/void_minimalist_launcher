import 'package:flutter/widgets.dart';
import 'package:return_zero/core/theme/app_layout.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: AppLayout.headerFlex(context),
      child: const Placeholder(),
    );
  }
}
