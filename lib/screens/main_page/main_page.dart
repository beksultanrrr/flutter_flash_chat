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
import 'package:flash_chat/core/widgets/report_widget.dart';
import 'package:flash_chat/screens/details_screen/details_screen.dart';
import 'package:flash_chat/screens/report_screen/report_screen.dart';
import 'package:flash_chat/screens/saved_screen/saved_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "package:permission_handler/permission_handler.dart";
import 'package:share/share.dart';

void shareContent(String text) {
  Share.share(text);
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  void toDetailsScreen(context, String title, double totalAmount, double collectedAmount, String bgImage, List<String> galleryImages, List<String>? subtitles, String description) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailsScreen(
              title: title,
              totalAmount: totalAmount,
              collectedAmount: collectedAmount,
              bgImage: bgImage,
              galleryImages: galleryImages,
              subtitle: subtitles,
              description: description,
            )));
  }

  void toShowAll(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SavedScreen()));
  }

  void toReportScreen(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            // <-- SEE HERE
            topLeft: const Radius.circular(25.0).r,
          ),
        ),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return const FractionallySizedBox(
            heightFactor: 0.93,
            child: ReportScreen(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    var t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primary,
          automaticallyImplyLeading: false,
          title: Text(
            t.charityFund,
            style: AppTextStyles.s18w700montserrat.copyWith(color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    t.helloAll,
                    style: AppTextStyles.s20w700montserrat,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    t.startUCharity,
                    style: AppTextStyles.s14w500montserrat.copyWith(color: AppColors.grey),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  HelpBannerWidget(
                    all: t.viewAll,
                    onTap: () => toShowAll(context),
                    title: t.recommendationCompany,
                    datas: data,
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: double.infinity,
                    height: 180.h,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10).r, color: AppColors.blue),
                    child: Row(children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10).r,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                t.shareUBlessings,
                                style: AppTextStyles.s16w700montserrat.copyWith(color: Colors.white),
                              ),
                              GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8).r, border: Border.all(color: Colors.white, width: 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5).r,
                                    child: Text(
                                      "Подробнее",
                                      style: AppTextStyles.s14w700montserrat.copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10).r,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                              child: SizedBox(
                                  height: double.infinity,
                                  child: Image.asset(
                                    "assets/images/ramadan.png",
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          )),
                    ]),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6).r,
              child: Column(
                children: [
                  ClickBanner(
                    title: t.sendAsGift,
                    subtitle: t.onLovedOnes,
                    image: "https://cdn2.iconfinder.com/data/icons/flat-seo-web-ikooni/128/flat_seo-21-1024.png",
                    buttonTitle: t.sendAsGift,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10).r,
                    child: ReportWidget(
                      title: t.donationFor,
                      buttonTitle: t.toLearnMore,
                      onTap: () => toReportScreen(context),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ClickBanner(
                    onTap: () {
                      shareContent(t.inviteSms('https://charity.kz'));
                    },
                    title: t.inviteFriends,
                    subtitle: t.toFightTogether,
                    image:
                        "https://resize.yandex.net/imgs_touch?key=880f62beeebb70d9b0cdfdfeadb4be07&url=https%3A%2F%2Fimages.squarespace-cdn.com%2Fcontent%2Fv1%2F5eb66125a2c9a8275e553676%2F1614222815124-S11Z7OIWPE0BHZ9RLN3H%2FDETEGO_WEB_ASSET_210224-08.png&width=1076&height=1125&typemap=png%3Apng%3B*%3Ajpg&quality=60&use-cache-headers=yes&crop=no&enlarge=no",
                    size: 170,
                    buttonTitle: t.inviteUFriends,
                    posLeft: -35,
                  ),
                ],
              ),
            )
          ],
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
  final double size;
  final double posLeft;

  const ClickBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonTitle,
    this.onTap,
    required this.image,
    this.size = 120,
    this.posLeft = -10,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(left: 10).r,
            child: Container(
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
                    SizedBox(
                      width: 50.w,
                      height: 50.w,
                    ),
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
            ),
          ),
        ),
        Positioned(left: posLeft, child: CachedNetworkImage(height: size.h, width: size.w, imageUrl: image)),
      ],
    );
  }
}
