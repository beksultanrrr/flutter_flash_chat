import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flash_chat/core/constants/app_text_styles.dart';
import 'package:flash_chat/core/constants/color_constants.dart';
import 'package:flash_chat/core/services/helper.dart';
import 'package:flash_chat/screens/card_pay_screen/car_pay_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    print(cardPayNumber);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primary,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.navigate_before,
              size: 35,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Детали платежа",
            style: AppTextStyles.s18w700montserrat.copyWith(color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Методы оплаты",
              style: AppTextStyles.s16w500montserrat,
            ),
            SizedBox(
              height: 20.h,
            ),
            cardPayNumber == ""
                ? Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppColors.secondaryPrimary),
                        child: Padding(
                          padding: const EdgeInsets.all(5).r,
                          child: const Icon(
                            Icons.add,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CardPayScreen(
                                      onTap: () => Navigator.pop(context),
                                    )),
                          ).then((value) {
                            if (value != null) {
                              setState(() {});
                            }
                          });
                        },
                        child: Text(
                          "Добавить способ оплаты",
                          style: AppTextStyles.s14w500montserrat.copyWith(color: AppColors.primary),
                        ),
                      )
                    ],
                  )
                : Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryPrimary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl: "https://www.pngplay.com/wp-content/uploads/5/Visa-Logo-PNG-HD-Quality.png",
                                width: 70,
                                height: 50,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 30).r,
                                child: Text(
                                  "Visa **** ${cardPayNumber.substring(cardPayNumber.length - 4)}",
                                  style: AppTextStyles.s14w600montserrat,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                cardPayNumber = '';
                              });
                            },
                            child: const Icon(Icons.remove),
                          )
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
