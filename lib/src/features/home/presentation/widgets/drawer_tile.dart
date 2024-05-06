import 'package:converse/src/shared/shared.dart';
import 'package:flutter/material.dart';

class AppDrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const AppDrawerTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: appColors.grey,
      ),
      title: Text(title),
    );
  }
}
