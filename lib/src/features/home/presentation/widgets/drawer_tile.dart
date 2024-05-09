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
      leading: Padding(
        padding: EdgeInsets.only(right: 17.w),
        child: Icon(
          icon,
          color: const Color(0xFF476072),
        ),
      ),
      title: Text(title),
    );
  }
}
