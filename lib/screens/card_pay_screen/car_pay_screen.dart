import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:flash_chat/core/constants/app_text_styles.dart';
import 'package:flash_chat/core/constants/color_constants.dart';
import 'package:flash_chat/core/services/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardPayScreen extends StatefulWidget {
  const CardPayScreen({
    super.key,
    this.isNext = false,
    this.onTap,
  });

  @override
  _CardPayScreenState createState() => _CardPayScreenState();

  final bool isNext;
  final Function()? onTap;
}

class _CardPayScreenState extends State<CardPayScreen> {
  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvv = '';
  bool showBack = false;

  late FocusNode _focusNode;
  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController expiryFieldCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  bool isEnteredCardNumber = false;
  bool isEnteredCardExpiry = false;
  bool isEnteredCardName = false;
  bool isEnteredCardCvv = false;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primary,
          automaticallyImplyLeading: false,
          title: Text(
            "Прикрепление карты",
            style: AppTextStyles.s18w700montserrat.copyWith(color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              CreditCard(
                cardNumber: cardNumber,
                cardExpiry: expiryDate,
                cardHolderName: cardHolderName,
                cvv: cvv,
                bankName: 'Axis Bank',
                showBackSide: showBack,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.white,
                showShadow: true,

                // mask: getCardTypeMask(cardType: CardType.americanExpress),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: cardNumberCtrl,
                      decoration: const InputDecoration(hintText: 'Card Number'),
                      maxLength: 16,
                      onChanged: (value) {
                        final newCardNumber = value.trim();
                        var newStr = '';
                        const step = 4;

                        for (var i = 0; i < newCardNumber.length; i += step) {
                          newStr += newCardNumber.substring(i, math.min(i + step, newCardNumber.length));
                          if (i + step < newCardNumber.length) newStr += ' ';
                        }

                        setState(() {
                          cardNumber = newStr;
                          cardPayNumber = newStr;

                          if (cardNumber.length > 13) {
                            isEnteredCardNumber = true;
                          } else {
                            isEnteredCardNumber = false;
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: expiryFieldCtrl,
                      decoration: const InputDecoration(hintText: 'Card Expiry'),
                      maxLength: 5,
                      onChanged: (value) {
                        var newDateValue = value.trim();
                        final isPressingBackspace = expiryDate.length > newDateValue.length;
                        final containsSlash = newDateValue.contains('/');

                        if (newDateValue.length >= 2 && !containsSlash && !isPressingBackspace) {
                          newDateValue = '${newDateValue.substring(0, 2)}/${newDateValue.substring(2)}';
                        }
                        setState(() {
                          expiryFieldCtrl.text = newDateValue;
                          expiryFieldCtrl.selection = TextSelection.fromPosition(TextPosition(offset: newDateValue.length));
                          expiryDate = newDateValue;
                          if (expiryDate.length > 3) {
                            isEnteredCardExpiry = true;
                          } else {
                            isEnteredCardExpiry = false;
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(hintText: 'Card Holder Name'),
                      onChanged: (value) {
                        setState(() {
                          cardHolderName = value;
                          if (cardHolderName.length > 10) {
                            isEnteredCardName = true;
                          } else {
                            isEnteredCardName = false;
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: 'CVV'),
                      maxLength: 3,
                      onChanged: (value) {
                        setState(() {
                          cvv = value;
                          if (cvv.length > 2) {
                            isEnteredCardCvv = true;
                          } else {
                            isEnteredCardCvv = false;
                          }
                        });
                      },
                      focusNode: _focusNode,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: isEnteredCardCvv && isEnteredCardExpiry && isEnteredCardName && isEnteredCardNumber ? AppColors.primary : Colors.grey.shade300,
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                            textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                        onPressed: isEnteredCardCvv && isEnteredCardExpiry && isEnteredCardName && isEnteredCardNumber ? widget.onTap : null,
                        child: Text(
                          widget.isNext ? "Далее" : "Прикрепить",
                          style: AppTextStyles.s20w700montserrat.copyWith(color: Colors.white),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
