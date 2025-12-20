import 'package:flutter/material.dart';

class GlanceSection extends StatefulWidget {
  const GlanceSection({super.key});

  @override
  State<GlanceSection> createState() => _GlanceSectionState();
}

class _GlanceSectionState extends State<GlanceSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
