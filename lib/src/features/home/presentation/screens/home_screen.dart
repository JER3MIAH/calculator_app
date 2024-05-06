import 'package:converse/src/features/home/presentation/drawer/app_drawer.dart';
import 'package:converse/src/shared/shared.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Converse .',
          style: TextStyle(
            color: appColors.blue,
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Home'),
      ),
      drawer: const AppDrawer()
    );
  }
}

