// // import 'package:flash_chat/core/constants/app_text_styles.dart';
// // import 'package:flash_chat/core/constants/color_constants.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:cached_network_image/cached_network_image.dart';
// // import 'package:flutter/widgets.dart';

// // class CarDetailsScreen extends StatelessWidget {
// //   const CarDetailsScreen({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         color: Colors.transparent,
// //         child: CustomScrollView(
// //           slivers: [
// //             SliverAppBar(
// //               backgroundColor: Colors.white,
// //               flexibleSpace: FlexibleSpaceBar(
// //                   background: Stack(
// //                 children: [
// //                   Positioned(
// //                     top: 0,
// //                     left: 0,
// //                     right: 0,
// //                     child: CachedNetworkImage(
// //                       imageUrl:
// //                           "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/2021_Kia_K5_GT-Line_in_Glacial_White_Pearl%2C_front_left.jpg/640px-2021_Kia_K5_GT-Line_in_Glacial_White_Pearl%2C_front_left.jpg",
// //                     ),
// //                   ),
// //                   Positioned(
// //                       bottom: 0,
// //                       child: Container(
// //                         decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
// //                         width: MediaQuery.of(context).size.width,
// //                         height: 40,
// //                       )),
// //                 ],
// //               )),
// //               // title: const Text('Title'),
// //               bottom: PreferredSize(
// //                 preferredSize: const Size.fromHeight(24),
// //                 child: Container(
// //                   height: 30,
// //                   width: double.infinity,
// //                   decoration: const BoxDecoration(
// //                     borderRadius: BorderRadius.vertical(
// //                       top: Radius.circular(20),
// //                     ),
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //               ),

// //               expandedHeight: 200.0,
// //             ),
// //             SliverToBoxAdapter(
// //               child: Container(
// //                 decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
// //                 child: Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 16),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         "Kia K5",
// //                         style: AppTextStyles.s20w700montserrat,
// //                       ),
// //                       Text(
// //                         "10000/сутки",
// //                         style: AppTextStyles.s16w600montserrat,
// //                       ),
// //                       const SizedBox(
// //                         height: 10,
// //                       ),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: [
// //                           Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Text(
// //                                 "Регион",
// //                                 style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
// //                               ),
// //                               const SizedBox(
// //                                 height: 5,
// //                               ),
// //                               Text(
// //                                 "Марка",
// //                                 style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
// //                               ),
// //                               const SizedBox(
// //                                 height: 5,
// //                               ),
// //                               Text(
// //                                 "Для такси",
// //                                 style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
// //                               ),
// //                               const SizedBox(
// //                                 height: 5,
// //                               ),
// //                               Text(
// //                                 "Водитель",
// //                                 style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
// //                               ),
// //                               const SizedBox(
// //                                 height: 5,
// //                               ),
// //                               Text(
// //                                 "Коробка передач",
// //                                 style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
// //                               ),
// //                               const SizedBox(
// //                                 height: 5,
// //                               ),
// //                               Text(
// //                                 "Стаж",
// //                                 style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
// //                               ),
// //                               const SizedBox(
// //                                 height: 5,
// //                               ),
// //                               Text(
// //                                 "Год",
// //                                 style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
// //                               ),
// //                             ],
// //                           ),
// //                           Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Text(
// //                                 "Алматы",
// //                                 style: AppTextStyles.s16w500montserrat,
// //                               ),
// //                               const SizedBox(
// //                                 height: 5,
// //                               ),
// //                               Text(
// //                                 "Kia k5",
// //                                 style: AppTextStyles.s16w500montserrat,
// //                               ),
// //                               const SizedBox(
// //                                 height: 5,
// //                               ),
// //                               Text(
// //                                 "Да",
// //                                 style: AppTextStyles.s16w500montserrat,
// //                               ),
// //                               const SizedBox(
// //                                 height: 5,
// //                               ),
// //                               Text(
// //                                 "Есть",
// //                                 style: AppTextStyles.s16w500montserrat,
// //                               ),
// //                               const SizedBox(
// //                                 height: 5,
// //                               ),
// //                               Text(
// //                                 "АКПП",
// //                                 style: AppTextStyles.s16w500montserrat,
// //                               ),
// //                               const SizedBox(
// //                                 height: 5,
// //                               ),
// //                               Text(
// //                                 "не важен",
// //                                 style: AppTextStyles.s16w500montserrat,
// //                               ),
// //                               const SizedBox(
// //                                 height: 5,
// //                               ),
// //                               Text(
// //                                 "2018",
// //                                 style: AppTextStyles.s16w500montserrat,
// //                               ),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                       const SizedBox(
// //                         height: 30,
// //                       ),
// //                       Row(
// //                         children: [
// //                           Expanded(
// //                             child: ElevatedButton(
// //                                 style: ElevatedButton.styleFrom(
// //                                   shape: RoundedRectangleBorder(
// //                                     borderRadius: BorderRadius.circular(30.0),
// //                                   ),
// //                                 ),
// //                                 onPressed: () {},
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.symmetric(vertical: 4),
// //                                   child: Text(
// //                                     "Позвонить",
// //                                     style: AppTextStyles.s16w700montserrat.copyWith(color: Colors.white),
// //                                   ),
// //                                 )),
// //                           ),
// //                           const SizedBox(
// //                             width: 10,
// //                           ),
// //                           Expanded(
// //                             child: ElevatedButton(
// //                                 style: ElevatedButton.styleFrom(
// //                                   shape: RoundedRectangleBorder(
// //                                     borderRadius: BorderRadius.circular(30.0),
// //                                   ),
// //                                 ),
// //                                 onPressed: () {},
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.symmetric(vertical: 4),
// //                                   child: Text(
// //                                     "Написать",
// //                                     style: AppTextStyles.s16w700montserrat.copyWith(color: Colors.white),
// //                                   ),
// //                                 )),
// //                           ),
// //                           const SizedBox(
// //                             height: 30,
// //                           ),
// //                         ],
// //                       )
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flash_chat/core/constants/app_text_styles.dart';
// import 'package:flash_chat/core/constants/color_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'dart:developer';

// class CarDetailsScreen extends StatefulWidget {
//   const CarDetailsScreen({
//     super.key,
//   });

//   @override
//   State<CarDetailsScreen> createState() => _CarDetailsScreenState();
// }

// class _CarDetailsScreenState extends State<CarDetailsScreen> {
//   ScrollController controller = ScrollController();

//   ScrollController _controller = ScrollController();
//   ScrollPhysics _physics = const ClampingScrollPhysics();

//   bool isChange = false;
//   @override
//   void initState() {
//     super.initState();
//     controller.addListener(() async {
//       if (controller.position.pixels > 40) {
//         setState(() {
//           isChange = false;
//           controller.position.pixels = 0;
//         });
//         setState(() => _physics = const ClampingScrollPhysics());
//       } else {
//         setState() {
//           _physics = const BouncingScrollPhysics();
//         }
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: CustomScrollView(scrollDirection: Axis.vertical, physics: _physics, controller: controller, slivers: [
//       SliverAppBar(
//         toolbarHeight: 35,
//         backgroundColor: Colors.white,

//         foregroundColor: Colors.white,
//         surfaceTintColor: Colors.white,
//         // title: Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
//         pinned: true,
//         expandedHeight: isChange ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.height * 0.3,
//         flexibleSpace: FlexibleSpaceBar(
//           background: InkWell(
//             onTap: () {
//               setState(() {
//                 isChange = true;
//               });
//             },
//             child: isChange
//                 ? Container(
//                     color: Colors.black,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
//                       child: CachedNetworkImage(
//                         imageUrl:
//                             "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/2021_Kia_K5_GT-Line_in_Glacial_White_Pearl%2C_front_left.jpg/640px-2021_Kia_K5_GT-Line_in_Glacial_White_Pearl%2C_front_left.jpg",
//                       ),
//                     ),
//                   )
//                 : Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20).r,
//                       color: Colors.white,
//                       image: const DecorationImage(
//                         image: CachedNetworkImageProvider(
//                           "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/2021_Kia_K5_GT-Line_in_Glacial_White_Pearl%2C_front_left.jpg/640px-2021_Kia_K5_GT-Line_in_Glacial_White_Pearl%2C_front_left.jpg",
//                         ),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//           ),
//         ),
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(24),
//           child: Container(
//             height: 30,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.vertical(
//                 top: Radius.circular(20),
//               ),
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       SliverToBoxAdapter(
//         child: Container(
//           decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Kia K5",
//                   style: AppTextStyles.s20w700montserrat,
//                 ),
//                 Text(
//                   "10000/сутки",
//                   style: AppTextStyles.s16w600montserrat,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Регион",
//                           style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Марка",
//                           style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Для такси",
//                           style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Водитель",
//                           style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Коробка передач",
//                           style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Стаж",
//                           style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Год",
//                           style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Алматы",
//                           style: AppTextStyles.s16w500montserrat,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Kia k5",
//                           style: AppTextStyles.s16w500montserrat,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Да",
//                           style: AppTextStyles.s16w500montserrat,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Есть",
//                           style: AppTextStyles.s16w500montserrat,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "АКПП",
//                           style: AppTextStyles.s16w500montserrat,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "не важен",
//                           style: AppTextStyles.s16w500montserrat,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "2018",
//                           style: AppTextStyles.s16w500montserrat,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 4),
//                             child: Text(
//                               "Позвонить",
//                               style: AppTextStyles.s16w700montserrat.copyWith(color: Colors.white),
//                             ),
//                           )),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 4),
//                             child: Text(
//                               "Написать",
//                               style: AppTextStyles.s16w700montserrat.copyWith(color: Colors.white),
//                             ),
//                           )),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//       SliverToBoxAdapter(
//         child: Container(
//           decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Kia K5",
//                   style: AppTextStyles.s20w700montserrat,
//                 ),
//                 Text(
//                   "10000/сутки",
//                   style: AppTextStyles.s16w600montserrat,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Регион",
//                           style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Марка",
//                           style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Для такси",
//                           style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Водитель",
//                           style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Коробка передач",
//                           style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Стаж",
//                           style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Год",
//                           style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.greyBanner),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Алматы",
//                           style: AppTextStyles.s16w500montserrat,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Kia k5",
//                           style: AppTextStyles.s16w500montserrat,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Да",
//                           style: AppTextStyles.s16w500montserrat,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Есть",
//                           style: AppTextStyles.s16w500montserrat,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "АКПП",
//                           style: AppTextStyles.s16w500montserrat,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "не важен",
//                           style: AppTextStyles.s16w500montserrat,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "2018",
//                           style: AppTextStyles.s16w500montserrat,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 4),
//                             child: Text(
//                               "Позвонить",
//                               style: AppTextStyles.s16w700montserrat.copyWith(color: Colors.white),
//                             ),
//                           )),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 4),
//                             child: Text(
//                               "Написать",
//                               style: AppTextStyles.s16w700montserrat.copyWith(color: Colors.white),
//                             ),
//                           )),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//       SliverToBoxAdapter(
//         child: SizedBox(height: 30.h),
//       ),
//     ]));
//   }
// }

