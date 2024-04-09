import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flash_chat/core/constants/app_text_styles.dart';
import 'package:flash_chat/core/constants/color_constants.dart';
import 'package:flash_chat/core/services/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphic/graphic.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            ),
            width: double.infinity,
            height: 50.h,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Text(
                      t.distributionOfDonations,
                      style: AppTextStyles.s14w600montserrat,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10).r,
                      child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Padding(
                              padding: const EdgeInsets.all(5).r,
                              child: const Icon(
                                Icons.close,
                                color: AppColors.primary,
                              ))),
                    ),
                  )
                ],
              ),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     SizedBox(
            //       width: 10.w,
            //     ),
            // GestureDetector(
            //     onTap: () => Navigator.pop(context),
            //     child: Padding(
            //         padding: const EdgeInsets.all(5).r,
            //         child: const Icon(
            //           Icons.close,
            //           color: AppColors.primary,
            //         ))),
            //   ],
            // ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20).r,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16).r,
                        decoration: BoxDecoration(border: Border(left: BorderSide(color: AppColors.yellow, width: 4.w))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10).r,
                          child: Text(
                            t.distributionOfDonationsDecription,
                            style: AppTextStyles.s13w400montserrat,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        t.distributionOfDonations,
                        style: AppTextStyles.s16w700montserrat,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        t.validFrom,
                        style: AppTextStyles.s12w500montserrat.copyWith(color: AppColors.grey),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      PieChart(
                        dataMap: dataMap,
                        animationDuration: const Duration(milliseconds: 800),
                        chartLegendSpacing: 32,

                        chartRadius: MediaQuery.of(context).size.width / 2.5,

                        colorList: const [Color(0xFF1F6EBB), Color(0xFF06A1E1), Color(0xFFFFBB00), Color(0xFF7A50A2)],
                        initialAngleInDegree: 0,
                        chartType: ChartType.ring,
                        ringStrokeWidth: 20,
                        centerText: "100 %",
                        legendOptions: const LegendOptions(
                          showLegendsInRow: false,
                          // legendPosition: LegendPosition.left,
                          showLegends: false,
                          legendTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        chartValuesOptions: ChartValuesOptions(
                          chartValueStyle: AppTextStyles.s18w100montserrat.copyWith(color: Colors.grey.shade700, fontWeight: FontWeight.w800),
                          showChartValueBackground: false,
                          showChartValues: false,
                          showChartValuesInPercentage: false,
                          showChartValuesOutside: false,
                          decimalPlaces: 1,
                        ),
                        // gradientList: ---To add gradient colors---
                        // emptyColorGradient: ---Empty Color gradient---
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      StatisticsWidget(
                          title: t.rUNWAYProgram,
                          subtitle: t.rUNWAYProgramSubtitle,
                          image: "https://lh3.googleusercontent.com/yH-SbuVm-xwUxvOLJdo75pDe4ZcKoMRUcTE1FJNv_iLejFk1h-H9wtC_NfnKJM_SZMU",
                          color: const Color(0xFF1F6EBB),
                          percent: 62),
                      StatisticsWidget(
                          title: t.fundraising,
                          subtitle: t.fundraisingSubtitle,
                          image: "https://avatars.mds.yandex.net/i?id=79c45a5ee30e53df6e70047b4235d65da3798893-5221567-images-thumbs&n=13",
                          color: const Color(0xFF06A1E1),
                          percent: 28),
                      StatisticsWidget(
                          title: t.productionCosts,
                          subtitle: t.productionCostsSubtitle,
                          image:
                              "https://resize.yandex.net/imgs_touch?key=244a1d774ea8cefa71080c6e45d6df99&url=https%3A%2F%2Fstatic.vecteezy.com%2Fsystem%2Fresources%2Fpreviews%2F005%2F969%2F464%2Foriginal%2Ftrendy-cog-concepts-vector.jpg&width=1125&height=1125&typemap=png%3Apng%3B*%3Ajpg&quality=60&use-cache-headers=yes&crop=no&enlarge=no",
                          color: const Color(0xFFFFBB00),
                          percent: 6),
                      StatisticsWidget(
                          title: t.paymentExpenses,
                          subtitle: t.paymentExpensesSubtitle,
                          image: "https://avatars.mds.yandex.net/i?id=22786f2cdf553ce10e7d1d371841f286_l-5252146-images-thumbs&n=13",
                          color: const Color(0xFF7A50A2),
                          percent: 4),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        width: double.infinity,
                        color: AppColors.greyButton,
                        height: 1,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16).r,
                        child: Text(
                          t.distributionOfDonationsUnderText,
                          style: AppTextStyles.s13w400montserrat,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.size = 50,
    required this.color,
    required this.percent,
  });
  final String title;
  final String subtitle;
  final String image;
  final double size;
  final Color color;
  final double percent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10).r,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CachedNetworkImage(width: 50.w, height: 50.h, imageUrl: image),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.s15w400montserrat.copyWith(fontWeight: FontWeight.w500)),
                  SizedBox(width: 200.w, child: Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppTextStyles.s12w400montserrat.copyWith(color: AppColors.grey)))
                ],
              ),
            ],
          ),
          Text(
            "$percent %",
            style: AppTextStyles.s18w100montserrat.copyWith(color: color, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
