import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AdProofColors {
  static const A140033 = Color(0xFF140033);
  static const AFD22D4 = Color(0xFFFD22D4);
  static const AFFB027 = Color(0xFFFFB027);
  static const ACFD9E3 = Color(0xFFCFD9E3);
  static const AF1F6FB = Color(0xFFF1F6FB);
  static const AF27E81 = Color(0xFFF27E81);
  static const A1C3957 = Color(0xFF1C3957);

  static final mSwatch = {
    50 : A140033,
    100 : A140033.withOpacity(0.1),
    200 : A140033.withOpacity(0.2),
    300 : A140033.withOpacity(0.3),
    400 : A140033.withOpacity(0.4),
    500 : A140033.withOpacity(0.5),
    600 : A140033.withOpacity(0.6),
    700 : A140033.withOpacity(0.7),
    800 : A140033.withOpacity(0.8),
    900 : A140033.withOpacity(0.9),
  };


  static final primaryColor = MaterialColor(0xFF140033, mSwatch);
}