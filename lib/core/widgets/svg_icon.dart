import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String path;
  final double width;
  final double height;

  final bool absolutePath;
  final Color? color;

  const SvgIcon(
    this.path, {
    super.key,
    this.absolutePath = false,
    required this.width,
    required this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      '$path.svg',
      width: width,
      height: height,
      alignment: Alignment.center,
      fit: BoxFit.contain,
      color: color,
    );
  }
}
