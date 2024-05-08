import 'package:converse/src/features/chat/logic/providers/chat_service_provider.dart';
import 'package:converse/src/features/home/logic/providers/user_provider.dart';
import 'package:converse/src/features/navigation/nav.dart';
import 'package:converse/src/features/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/widgets.dart';

class ListOfUsersView extends ConsumerWidget {
  const ListOfUsersView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userProv = ref.watch(userProvider);

    return StreamBuilder(
      stream: ref.watch(chatServiceProvider).getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        final users = snapshot.data ?? [];
        final filteredUsers =
            users.where((user) => user.email != userProv.user.email).toList();

        return ListView.builder(
          itemCount: filteredUsers.length,
          itemBuilder: (context, index) {
            final user = filteredUsers[index];
            if (user.email != userProv.user.email) {
              return UserTile(
                onTap: () {
                  AppNavigator.pushNamed(
                    ChatRoutes.chat,
                    args: user,
                  );
                },
                username: user.username,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        );
      },
    );
  }
}
