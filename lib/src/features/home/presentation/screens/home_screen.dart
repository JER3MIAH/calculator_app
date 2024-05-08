import 'package:converse/src/features/home/logic/providers/user_provider.dart';
import 'package:converse/src/features/home/presentation/drawer/app_drawer.dart';
import 'package:converse/src/features/home/presentation/screens/views/list_of_users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context).colorScheme;

    useEffect(() {
      ref.read(userProvider.notifier).retrieveUserInfo();
      return null;
    }, const []);

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
