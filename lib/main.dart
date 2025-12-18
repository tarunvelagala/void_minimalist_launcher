import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:return_zero/app/app.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that SystemChrome can be called
  WidgetsFlutterBinding.ensureInitialized();

  // Lock the app to portrait mode
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const App());
}
