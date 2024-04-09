import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key, this.height, this.width});
  final int? height;
  final int? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
        child: Container(
            height: height?.h,
            width: width?.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12).r,
            )));
  }
}
