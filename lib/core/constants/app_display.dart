import 'package:flutter/material.dart';

import '../services/device_type.dart';

class AppDisplay {
  static Size getSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    debugPrint('$width * $height');
    Size size = Size(width, height);

    if (getDeviceType() == DeviceType.Tablet) {
      debugPrint('****************TABLET****************');

      if (width / height > 1.68) {
        debugPrint('Size(1024, 600)');
        size = const Size(1024, 600);
      } else if (width / height > 1.28) {
        debugPrint('Size(1024, 800)');
        size = const Size(1024, 800);
      }
    }
    if (getDeviceType() == DeviceType.Phone) {
      debugPrint('****************PHONE****************');

      if (height / width > 2.15) {
        debugPrint('Size(395, 856);');
        size = const Size(395, 856);
      } else if (height / width > 1.95) {
        debugPrint('Size(395, 784)');
        size = const Size(395, 784);
      }
      // else if (height / width > 1.65) {
      //   debugPrint('Size(360, 640)');
      //   size = const Size(395, 660);
      // }
      else if (height / width > 1.6) {
        debugPrint('Size(395, 660) - 16/9');
        size = const Size(395, 660);
      }
    }
    return size;
  }
}
