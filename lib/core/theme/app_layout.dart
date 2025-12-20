import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppLayout {
  // --- Margin & Padding ---
  static double screenMargin(BuildContext context) => ResponsiveValue<double>(
    context,
    defaultValue: 24.0,
    conditionalValues: [
      const Condition.equals(name: MOBILE, value: 24.0),
      const Condition.equals(name: TABLET, value: 40.0),
      const Condition.largerThan(name: TABLET, value: 64.0),
    ],
  ).value;

  static double contentPadding(BuildContext context) => ResponsiveValue<double>(
    context,
    defaultValue: 16.0,
    conditionalValues: [
      const Condition.equals(name: MOBILE, value: 16.0),
      const Condition.equals(name: TABLET, value: 24.0),
      const Condition.largerThan(name: TABLET, value: 32.0),
    ],
  ).value;

  // --- Spacing ---
  static double elementSpacing(BuildContext context) => ResponsiveValue<double>(
    context,
    defaultValue: 12.0,
    conditionalValues: [
      const Condition.equals(name: MOBILE, value: 12.0),
      const Condition.equals(name: TABLET, value: 20.0),
      const Condition.largerThan(name: TABLET, value: 28.0),
    ],
  ).value;

  static double sectionSpacing(BuildContext context) => ResponsiveValue<double>(
    context,
    defaultValue: 40.0,
    conditionalValues: [
      const Condition.equals(name: MOBILE, value: 40.0),
      const Condition.equals(name: TABLET, value: 64.0),
      const Condition.largerThan(name: TABLET, value: 96.0),
    ],
  ).value;

  // --- Flex Factors ---
  // --- Flex Factors ---
  static int flexSmall(BuildContext context) => ResponsiveValue<int>(
    context,
    defaultValue: 10,
    conditionalValues: [
      const Condition.equals(name: MOBILE, value: 10),
      const Condition.equals(name: TABLET, value: 12),
      const Condition.largerThan(name: TABLET, value: 15),
    ],
  ).value;

  static int flexMedium(BuildContext context) => ResponsiveValue<int>(
    context,
    defaultValue: 20,
    conditionalValues: [
      const Condition.equals(name: MOBILE, value: 20),
      const Condition.equals(name: TABLET, value: 25),
      const Condition.largerThan(name: TABLET, value: 30),
    ],
  ).value;

  static int flexLarge(BuildContext context) => ResponsiveValue<int>(
    context,
    defaultValue: 60,
    conditionalValues: [
      const Condition.equals(name: MOBILE, value: 60),
      const Condition.equals(name: TABLET, value: 65),
      const Condition.largerThan(name: TABLET, value: 70),
    ],
  ).value;

  // --- Settings Columns ---
  static int settingsColumnCount(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return ResponsiveValue<int>(
      context,
      defaultValue: orientation == Orientation.landscape ? 2 : 1,
      conditionalValues: const [
        Condition.largerThan(name: TABLET, value: 2),
        Condition.largerThan(name: DESKTOP, value: 3),
      ],
    ).value;
  }
}
