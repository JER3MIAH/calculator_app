import 'package:converse/src/features/chat/logic/providers/chat_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListOfUsersView extends ConsumerWidget {
  const ListOfUsersView({super.key});

  @override
  Widget build(BuildContext context, ref) {
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

        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return UserTile(
              onTap: () {
                // Handle onTap
              },
              username: user.email,
            );
          },
        );
      },
    );
  }
}

class UserTile extends StatelessWidget {
  final VoidCallback onTap;
  final String username;
  const UserTile({
    super.key,
    required this.onTap,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(username),
    );
  }
}
