import 'package:flutter/material.dart';

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
