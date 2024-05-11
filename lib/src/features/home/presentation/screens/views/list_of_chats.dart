import 'package:converse/src/features/chat/logic/providers/chat_service_provider.dart';
import 'package:converse/src/features/home/logic/providers/user_provider.dart';
import 'package:converse/src/features/navigation/nav.dart';
import 'package:converse/src/features/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/widgets.dart';

class ListOfChatsView extends ConsumerWidget {
  const ListOfChatsView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userProv = ref.watch(userProvider);

    return StreamBuilder(
      stream: ref.watch(chatServiceProvider).getChattedUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        final chats = snapshot.data ?? [];
        final filteredUsers =
            chats.where((user) => user.email != userProv.user.email).toList();
        return ListView.builder(
          itemCount: filteredUsers.length,
          itemBuilder: (context, index) {
            final user = filteredUsers[index];
            if (user.email != userProv.user.email) {
              return ChatTile(
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
