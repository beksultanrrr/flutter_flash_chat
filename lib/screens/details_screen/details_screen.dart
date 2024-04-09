// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flash_chat/screens/pay_screen.dart/pay_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flash_chat/core/constants/app_text_styles.dart';
import 'package:flash_chat/core/constants/color_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  ScrollPageController imageController = ScrollPageController();

  DetailsScreen(
      {super.key, required this.title, required this.totalAmount, required this.collectedAmount, required this.bgImage, required this.galleryImages, this.subtitle, required this.description});
  final String title;
  final double totalAmount;
  final double collectedAmount;
  final String bgImage;
  final List<String>? subtitle;
  final List<String> galleryImages;
  final String description;
  void toPayScreen(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const PayScreen()));
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.navigate_before,
            size: 35,
            color: Colors.white,
          ),
        ),
        title: SizedBox(
          width: 250.w,
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.s18w700montserrat.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(bgImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 240,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    child: SizedBox(
                      width: 300.w,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: AppTextStyles.s18w700montserrat.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
              child: Column(
                children: [
                  if (subtitle != null)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: subtitle!.map((item) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10).r,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.greyBanner2,
                                borderRadius: BorderRadius.circular(30).r,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 7).r,
                              child: Text(
                                item,
                                style: AppTextStyles.s12w400montserrat.copyWith(color: AppColors.grey),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        // color: Colors.blue,
                        // width: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              t.requiredAmount,
                              style: AppTextStyles.s12w400montserrat.copyWith(color: AppColors.grey),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "$totalAmount ₸",
                              style: AppTextStyles.s14w500montserrat,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(t.collectedAmount, style: AppTextStyles.s12w400montserrat.copyWith(color: AppColors.grey)),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "$collectedAmount ₸",
                              style: AppTextStyles.s14w500montserrat,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.review,
                        style: AppTextStyles.s16w700montserrat,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          text: description,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        t.imageGallery,
                        style: AppTextStyles.s16w700montserrat,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300.h,
              child: ScrollPageView(
                isTimer: false,
                checkedIndicatorColor: AppColors.orange,
                indicatorAlign: Alignment.bottomCenter,
                indicatorPadding: const EdgeInsets.only(bottom: 40),
                controller: imageController,
                children: (galleryImages.reversed).map((image) {
                  return ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).r,
        child: ElevatedButton(
          onPressed: () {
            toPayScreen(context);
            // Write your onPressed function here
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            minimumSize: Size(
              double.infinity,
              40.h,
            ),
          ),
          child: Text(
            t.donate,
            style: AppTextStyles.s16w500montserrat,
          ),
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 20),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      // ElevatedButton(
      //     onPressed: () {},
      //     child: Center(
      // child: Text(
      //   "Пожертвовать сейчас",
      //   style: AppTextStyles.s16w400montserrat,
      // ),
      //     )),
      //     ],
      //   ),
      // )
    );
  }
}


// class DetailsScreen extends StatelessWidget {
//   const DetailsScreen({
//     super.key,
//     required this.title,
//     required this.totalAmount,
//     required this.collectedAmount,
//     required this.bgImage,
//     required this.galleryImages,
//     this.subtitle,
//   });
//   final String title;
//   final double totalAmount;
//   final double collectedAmount;
//   final String bgImage;
//   final List<String>? subtitle;
//   final List<String> galleryImages;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: CachedNetworkImageProvider(bgImage),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Stack(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 240,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
//                         begin: Alignment.bottomCenter,
//                         end: Alignment.center,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 20,
//                     left: 0,
//                     child: SizedBox(
//                       width: 300.w,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 20, right: 20),
//                         child: Align(
//                           alignment: Alignment.bottomLeft,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 title,
//                                 style: AppTextStyles.s18w700montserrat.copyWith(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10.h,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16).r,
//               child: Column(
//                 children: [
//                   if (subtitle != null)
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: subtitle!.map((item) {
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10).r,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: AppColors.greyBanner2,
//                                 borderRadius: BorderRadius.circular(30).r,
//                               ),
//                               padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 7).r,
//                               child: Text(
//                                 item,
//                                 style: AppTextStyles.s12w400montserrat.copyWith(color: AppColors.grey),
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         // color: Colors.blue,
//                         // width: MediaQuery.of(context).size.width / 2,
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Необходимая сумма",
//                               style: AppTextStyles.s12w400montserrat.copyWith(color: AppColors.grey),
//                             ),
//                             SizedBox(
//                               height: 5.h,
//                             ),
//                             Text(
//                               "$totalAmount ₸",
//                               style: AppTextStyles.s14w500montserrat,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Собранная сумма", style: AppTextStyles.s12w400montserrat.copyWith(color: AppColors.grey)),
//                             SizedBox(
//                               height: 5.h,
//                             ),
//                             Text(
//                               "$collectedAmount ₸",
//                               style: AppTextStyles.s14w500montserrat,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 30.h,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Обзор",
//                         style: AppTextStyles.s16w700montserrat,
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       RichText(
//                         textAlign: TextAlign.justify,
//                         text: TextSpan(
//                           text:
//                               "В глухой деревне, среди опустошенных земель, живет семья из пятерых детей и их родителей. Дом, построенный своими руками, трескается от старости и ветра. Родители трудятся без устали, но доход ничтожно мал и едва хватает на самое необходимое. Дети, одетые в потрепанные одежды, вырастают среди лишений, мечтая о ярком будущем. В такой обстановке им не хватает обычных радостей детства и возможностей для образования. Семья нуждается в помощи - в материальной поддержке, в строительстве надежного жилища и в шансе на достойное будущее для своих детей.",
//                           style: TextStyle(
//                             fontSize: 15.sp,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.grey,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 100.h,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16).r,
//         child: ElevatedButton(
//           onPressed: () {
//             print('Button Pressed');
//             // Write your onPressed function here
//           },
//           style: ElevatedButton.styleFrom(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(
//                 8.0,
//               ),
//             ),
//             minimumSize: Size(
//               double.infinity,
//               40.h,
//             ),
//           ),
//           child: Text(
//             "Пожертвовать сейчас",
//             style: AppTextStyles.s16w400montserrat,
//           ),
//         ),
//       ),
//       // bottomNavigationBar: Padding(
//       //   padding: const EdgeInsets.symmetric(horizontal: 20),
//       //   child: Column(
//       //     mainAxisAlignment: MainAxisAlignment.end,
//       //     children: [
//       // ElevatedButton(
//       //     onPressed: () {},
//       //     child: Center(
//       // child: Text(
//       //   "Пожертвовать сейчас",
//       //   style: AppTextStyles.s16w400montserrat,
//       // ),
//       //     )),
//       //     ],
//       //   ),
//       // )
//     );
//   }
// }
