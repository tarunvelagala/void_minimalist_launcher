import 'package:flutter/material.dart';

class ReturnZeroApp extends StatelessWidget {
  const ReturnZeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SizedBox.shrink()),
    );
  }
}
