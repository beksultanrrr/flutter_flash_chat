import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flash_chat/core/constants/app_text_styles.dart';
import 'package:flash_chat/core/constants/color_constants.dart';
import 'package:flash_chat/screens/details_screen/details_screen.dart';
import 'package:flash_chat/screens/main_page/widgets/recommendation_company_model.dart';
import 'package:flash_chat/screens/pay_screen.dart/pay_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HelpBannerWidget extends StatelessWidget {
  const HelpBannerWidget({super.key, required this.datas, required this.title, this.all, this.onTap});

  final List<RecommendationCompanyModel> datas;
  final String title;
  final String? all;
  final Function()? onTap;
  void toDetailsScreen(
    context,
    String title,
    double totalAmount,
    double collectedAmount,
    String bgImage,
    List<String> galleryImages,
    List<String>? subtitles,
    String description,
  ) {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 200.w,
              child: Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            if (all != null) InkWell(onTap: onTap, child: Text(all!, style: AppTextStyles.s13w400montserrat.copyWith(color: AppColors.primary))),
            SizedBox(width: 10.w),
          ],
        ),
        CarouselSlider.builder(
          itemCount: datas.length,
          options: CarouselOptions(
            autoPlay: true,
            height: 440.0.h,
            disableCenter: true,
            padEnds: false,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            viewportFraction: 0.93,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            enlargeFactor: 0.35,
            scrollPhysics: const BouncingScrollPhysics(),
          ),
          itemBuilder: (context, itemIndex, realIndex) {
            final item = datas[itemIndex];
            return RecommendationCompanyItem(
              onTap: () => toDetailsScreen(context, item.title, item.totalAmount, item.collectedAmount, item.image, item.galleryImages, item.subtitle, item.description),
              title: item.title,
              totalAmount: item.totalAmount,
              collectedAmount: item.totalAmount,
              image: item.image,
              subtitle: item.subtitle,
            );
          },
        ),
      ],
    );
  }
}

class RecommendationCompanyItem extends StatelessWidget {
  const RecommendationCompanyItem({super.key, required this.title, required this.totalAmount, required this.collectedAmount, required this.image, this.subtitle, this.onTap});

  final String title;
  final double totalAmount;
  final double collectedAmount;
  final String image;
  final List<String>? subtitle;
  final Function()? onTap;

  void toPayScreen(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const PayScreen()));
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 5).r,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15).r,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0, // soften the shadow
                spreadRadius: 5.0, //extend the shadow
                offset: Offset(
                  1.0,
                  1.0,
                ),
              )
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                  child: Container(
                    width: double.infinity,
                    height: 240.h,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 20,
                            left: 0,
                            child: SizedBox(
                              width: 300.w,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    title,
                                    style: AppTextStyles.s18w700montserrat.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15).r,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              toPayScreen(context);
                            },
                            child: Center(
                              child: Text(
                                t.donateNow,
                                style: AppTextStyles.s16w400montserrat.copyWith(color: Colors.white),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
