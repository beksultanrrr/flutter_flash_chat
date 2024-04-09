import 'package:flutter/widgets.dart';

// ignore: constant_identifier_names
enum DeviceType { Phone, Tablet }

DeviceType getDeviceType() {
  // ignore: deprecated_member_use
  final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
  return data.size.shortestSide < 520 ? DeviceType.Phone : DeviceType.Tablet;
}
