import 'package:converse/src/features/home/presentation/drawer/app_drawer.dart';
import 'package:converse/src/features/home/presentation/screens/views/list_of_users.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Converse .',
            style: TextStyle(
              color: theme.primary,
            ),
          ),
          centerTitle: true,
        ),
        body: const ListOfUsersView(),
        drawer: const AppDrawer());
  }
}
