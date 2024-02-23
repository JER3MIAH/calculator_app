import 'dart:async';

import 'package:converse/src/app.dart';
import 'package:converse/src/global.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}
