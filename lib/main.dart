import 'package:converse/src/app.dart';
import 'package:converse/src/core/data/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.initDependencies();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
