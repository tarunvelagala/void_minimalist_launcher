import 'package:flutter/material.dart';

extension CrossAxisAlignmentX on CrossAxisAlignment {
  /// Converts CrossAxisAlignment to MainAxisAlignment for child Rows
  MainAxisAlignment get toMainAxis {
    switch (this) {
      case CrossAxisAlignment.start:
        return MainAxisAlignment.start;
      case CrossAxisAlignment.end:
        return MainAxisAlignment.end;
      case CrossAxisAlignment.center:
      default:
        return MainAxisAlignment.center;
    }
  }
}
