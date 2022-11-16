import 'dart:ui';

import 'package:flutter/material.dart';

const Color bluish = Color(0xFF4e5ae8);
const Color yellow = Color(0xFFFFB746);
const Color pink = Color(0xFFff4667);
const Color darkGrey = Color(0xFF121212);
const Color header = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
    primaryColor: Colors.orange,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    primaryColor: Colors.yellow,
    brightness: Brightness.light,
  );
}
