import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppLayout {
  // --- Margin & Padding ---
  static double screenMargin(BuildContext context) => ResponsiveValue<double>(
    context,
    conditionalValues: [
      const Condition.equals(name: MOBILE, value: 24.0),
      const Condition.equals(name: TABLET, value: 40.0),
      const Condition.largerThan(name: TABLET, value: 64.0),
    ],
  ).value;

  static double contentPadding(BuildContext context) => ResponsiveValue<double>(
    context,
    conditionalValues: [
      const Condition.equals(name: MOBILE, value: 16.0),
      const Condition.equals(name: TABLET, value: 24.0),
      const Condition.largerThan(name: TABLET, value: 32.0),
    ],
  ).value;

  // --- Spacing ---
  static double elementSpacing(BuildContext context) => ResponsiveValue<double>(
    context,
    conditionalValues: [
      const Condition.equals(name: MOBILE, value: 12.0),
      const Condition.equals(name: TABLET, value: 20.0),
      const Condition.largerThan(name: TABLET, value: 28.0),
    ],
  ).value;

  static double sectionSpacing(BuildContext context) => ResponsiveValue<double>(
    context,
    conditionalValues: [
      const Condition.equals(name: MOBILE, value: 40.0),
      const Condition.equals(name: TABLET, value: 64.0),
      const Condition.largerThan(name: TABLET, value: 96.0),
    ],
  ).value;

  // --- Flex Factor ---
  static int headerFlex(BuildContext context) => ResponsiveValue<int>(
    context,
    conditionalValues: [
      const Condition.equals(name: MOBILE, value: 15),
      const Condition.equals(name: TABLET, value: 15),
      const Condition.largerThan(name: TABLET, value: 15),
    ],
  ).value;
  static int appsFlex(BuildContext context) => ResponsiveValue<int>(
    context,
    conditionalValues: [
      const Condition.equals(name: MOBILE, value: 70),
      const Condition.equals(name: TABLET, value: 70),
      const Condition.largerThan(name: TABLET, value: 70),
    ],
  ).value;
  static int instructionsFlex(BuildContext context) => ResponsiveValue<int>(
    context,
    conditionalValues: [
      const Condition.equals(name: MOBILE, value: 10),
      const Condition.equals(name: TABLET, value: 10),
      const Condition.largerThan(name: TABLET, value: 10),
    ],
  ).value;

  static int glanceFlex(BuildContext context) => ResponsiveValue<int>(
    context,
    conditionalValues: [
      const Condition.equals(name: MOBILE, value: 5),
      const Condition.equals(name: TABLET, value: 5),
      const Condition.largerThan(name: TABLET, value: 5),
    ],
  ).value;
}
