// import 'package:flutter/material.dart';


// class ModalBottomSheet {
//   static Future<dynamic> showSheet({
//     bool? isDraggable,
//     required BuildContext context,
//     String? title,
//     required Widget anyWidget,
//   }) {
//     return showModalBottomSheet(
//       useRootNavigator: true,
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (_) {
//         if (isDraggable == true) {
//           return DraggableScrollableSheet(
//               minChildSize: 0.25,
//               initialChildSize: 0.4,
//               maxChildSize: 0.9,
//               builder: (_, controller) =>
//                   BottomSheetWidget(title: title, anyWidget: anyWidget));
//         } else {
//           return BottomSheetWidget(title: title, anyWidget: anyWidget);
//         }
//       },
//     );
//   }
// }

// class BottomSheetWidget extends StatelessWidget {
//   final String? title;
//   final Widget anyWidget;
//   const BottomSheetWidget({
//     required this.title,
//     required this.anyWidget,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: MediaQuery.of(context).size.height * 0.4,
//       decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(12.r),
//             topRight: Radius.circular(12.r),
//           )),
//       child: Stack(
//         children: [
//           Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Center(
//                 child: Container(
//                   height: 6.h,
//                   width: 40.w,
//                   margin: EdgeInsets.only(top: 8.h, bottom: 12.h),
//                   decoration: BoxDecoration(
//                       color: AppColors.grey,
//                       borderRadius: BorderRadius.circular(3)),
//                 ),
//               ),
//               title == null
//                   ? Container()
//                   : Center(
//                       child: Text(
//                         title!,
//                         style: AppTextStyles.s16w600inter,
//                       ),
//                     ),
//             ],
//           ),
//           Padding(
//             padding: title == null
//                 ? EdgeInsets.only(top: 24.h)
//                 : EdgeInsets.only(top: 40.h),
//             child: SingleChildScrollView(
//               child: anyWidget,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
