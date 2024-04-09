import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flash_chat/core/constants/app_text_styles.dart';
import 'package:flash_chat/core/services/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphic/graphic.dart';
import 'package:pie_chart/pie_chart.dart';

class ReportWidget extends StatefulWidget {
  const ReportWidget({super.key, required this.title, required this.buttonTitle, this.onTap});

  final String title;
  final String buttonTitle;
  final Function()? onTap;

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  bool rebuild = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 2.0, // soften the shadow
            spreadRadius: 2.0, //extend the shadow
            offset: const Offset(
              1.0, // Move to right 5  horizontally
              1.0, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: 15,
        ).r,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 160.h,
              child: Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: 140.w,
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    widget.title,
                    style: AppTextStyles.s14w600montserrat,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8).r, border: Border.all(color: Colors.black, width: 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8).r,
                      child: Text(
                        widget.buttonTitle,
                        style: AppTextStyles.s14w700montserrat,
                      ),
                    ),
                  ),
                )
              ]),
            ),
            PieChart(
              dataMap: dataMap,
              animationDuration: const Duration(milliseconds: 800),
              chartLegendSpacing: 32,

              chartRadius: MediaQuery.of(context).size.width / 3.2,

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
          ],
        ),
      ),
    );
  }
}
//     return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16).r,
//         child: Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.only(top: 10),
//               width: 350,
//               height: 300,
//               child: Chart(
//                 rebuild: rebuild,
//                 data: basicData,
//                 variables: {
//                   'genre': Variable(
//                     accessor: (Map map) => map['genre'] as String,
//                   ),
//                   'sold': Variable(
//                     accessor: (Map map) => map['sold'] as num,
//                   ),
//                 },
//                 transforms: [
//                   Proportion(
//                     variable: 'sold',
//                     as: 'percent',
//                   )
//                 ],
//                 marks: [
//                   IntervalMark(
//                     position: Varset('percent') / Varset('genre'),
//                     label: LabelEncode(
//                         encoder: (tuple) => Label(
//                               tuple['sold'].toString(),
//                               LabelStyle(textStyle: Defaults.runeStyle),
//                             )),
//                     color: ColorEncode(variable: 'genre', values: Defaults.colors10),
//                     modifiers: [StackModifier()],
//                     transition: Transition(duration: const Duration(seconds: 2)),
//                     entrance: {MarkEntrance.y},
//                   )
//                 ],
//                 coord: PolarCoord(transposed: true, dimCount: 1),
//               ),
//             ),
//           ],
//         ));
//   }
// }
