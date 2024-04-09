// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// class Utils {
//   late BuildContext context;

//   Utils(this.context);

//   void showModalBottomSheet(List<Widget> children) {
//     showMaterialModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(16.0),
//         ),
//       ),
//       builder: (context) {
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IntrinsicHeight(
//               child: Padding(
//                 // padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10).r,
//                 padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0).r,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ...children,
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
