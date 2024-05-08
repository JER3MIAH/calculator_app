import 'package:converse/src/features/home/logic/providers/chat_service_provider.dart';
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

        return ListView(
          children: snapshot.data!
              .map<Widget>(
                (userData) => UserTile(
                  onTap: () {},
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class UserTile extends StatelessWidget {
  final VoidCallback onTap;
  const UserTile({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(onTap: onTap);
  }
}
