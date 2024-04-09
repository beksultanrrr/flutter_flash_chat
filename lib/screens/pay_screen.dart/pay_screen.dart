import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flash_chat/core/constants/app_text_styles.dart';
import 'package:flash_chat/core/constants/color_constants.dart';
import 'package:flash_chat/core/services/helper.dart';
import 'package:flash_chat/screens/success_pay/success_pay.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphic/graphic.dart';

import '../card_pay_screen/car_pay_screen.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({super.key});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  FocusNode focusNode = FocusNode();

  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  void toPaySuccessScreen(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessPay()));
  }

  bool? isCorrect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20).r,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cумма взноса",
                  style: AppTextStyles.s18w700montserrat,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Пожалуйста введи желаемый размер твоего пожертвования. Наш манимальный взнос составляет 100 ₸.",
                  style: AppTextStyles.s14w500montserrat.copyWith(color: AppColors.grey),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Form(
                    child: Column(children: [
                  TextFormField(
                    controller: textEditingController,
                    // validator: (value) {
                    // if (int.tryParse(value ?? "0")! > 100) {
                    //     return "D";
                    //   }

                    // },

                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorText: isCorrect == false ? 'Пожалуйста введите большее 100 ₸.' : null,
                      fillColor: Colors.grey.shade200,
                      contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10).r,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      hintText: "0.0 ₸",
                    ),
                    focusNode: focusNode,
                  )
                ])),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 40.h,
                  child: ElevatedButton(
                      onPressed: () {
                        if (textEditingController.text.isNotEmpty) {
                          if (double.parse(textEditingController.text.replaceAll(",", "")) >= 100 && cardPayNumber != '') {
                            setState(() {
                              print(double.parse(textEditingController.text.replaceAll(",", "")));
                              isCorrect = true;
                            });
                            toPaySuccessScreen(context);
                          } else if (double.parse(textEditingController.text.replaceAll(",", "")) >= 100 && cardPayNumber == '') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CardPayScreen(
                                        onTap: () => toPaySuccessScreen(context),
                                        isNext: true,
                                      )),
                            );
                          } else {
                            setState(() {
                              print("D");
                              isCorrect = false;
                            });
                          }
                        } else {
                          setState(() {
                            print("D");
                            isCorrect = false;
                          });
                        }
                      },
                      child: Center(
                        child: Text(
                          "Подтвердить взнос",
                          style: AppTextStyles.s16w500montserrat,
                        ),
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
