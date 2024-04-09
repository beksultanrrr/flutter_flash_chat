// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flash_chat/core/constants/app_text_styles.dart';
import 'package:flash_chat/core/constants/color_constants.dart';
import 'package:flash_chat/core/services/helper.dart';
import 'package:flash_chat/core/widgets/help_banner_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  t.chooseWhereDonate,
                  style: AppTextStyles.s20w700montserrat,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  t.changeTheWord,
                  style: AppTextStyles.s14w500montserrat.copyWith(color: AppColors.grey),
                ),
                SizedBox(
                  height: 30.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 170,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          "https://img.inform.kz/kazinform-photobank/media/2023-09-14/bb0ebeab-e9b4-4e60-9b91-282d205573a6.webp",
                        ),
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
                          top: 20,
                          left: 0,
                          child: SizedBox(
                            child: Container(
                              decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)), color: Colors.red),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        t.emergencySituation,
                                        style: AppTextStyles.s16w500montserrat.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      t.provideVitalAssistance,
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
                ),
                SizedBox(
                  height: 20.h,
                ),
                HelpBannerWidget(
                  title: "Рекомендованные компании по сбору средств2",
                  datas: data2,
                ),
                SizedBox(
                  height: 15.h,
                ),
                HelpBannerWidget(
                  title: "Рекомендованные компании по сбору средств",
                  datas: data,
                ),
                SizedBox(
                  height: 15.h,
                ),
                HelpBannerWidget(
                  title: "Рекомендованные компании по сбору средств",
                  datas: data,
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClickBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonTitle;
  final Function()? onTap;
  final String image;

  const ClickBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonTitle,
    this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        color: AppColors.lightBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 10, left: 15, right: 10).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedNetworkImage(height: 70.h, width: 70.w, imageUrl: image),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(
                title,
                style: AppTextStyles.s14w600montserrat,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.s12w400montserrat.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8).r, border: Border.all(color: Colors.black, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8).r,
                    child: Text(
                      buttonTitle,
                      style: AppTextStyles.s14w700montserrat,
                    ),
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
