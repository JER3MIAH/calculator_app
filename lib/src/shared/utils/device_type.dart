import 'package:flutter/material.dart';

class KDeviceType {
  final BuildContext context;

  KDeviceType(this.context);

  bool get isMobile => MediaQuery.of(context).size.width < 600;

  bool get isTablet =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;

  bool get isDesktop => MediaQuery.of(context).size.width >= 1200;
}
