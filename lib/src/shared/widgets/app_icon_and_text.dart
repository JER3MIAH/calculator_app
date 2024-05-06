import 'package:converse/src/shared/shared.dart';
import 'package:flutter/material.dart';

class AppIconAndText extends StatelessWidget {
  final double? width;
  const AppIconAndText({
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return AppColumn(
      width: width ?? MediaQuery.of(context).size.width,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 50.h,
          width: 50.w,
          child: FittedBox(child: Image.asset(appIcon)),
        ),
        YBox(5.h),
        Text(
          'Converse',
          style: TextStyle(
            color: theme.primary,
            fontSize: 21.2.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
