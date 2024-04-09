import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/core/constants/app_text_styles.dart';
import 'package:flash_chat/core/constants/color_constants.dart';
import 'package:flash_chat/screens/language_setting_screen/language_setting.dart';
import 'package:flash_chat/screens/payment_details/payment_details_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  void toPaymentDetails(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PaymentDetailsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

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
            "Настройки",
            style: AppTextStyles.s18w700montserrat.copyWith(color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10).r,
        child: ListView(children: [
          SettingsWidget(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LanguageSettings()),
              );
            },
            icon: Icons.language,
            title: t.enterYourNumber,
          ),
          const Divider(
            color: AppColors.greyButton,
          ),
          SettingsWidget(
            onTap: () => toPaymentDetails(context),
            icon: Icons.credit_card,
            title: "Детали платежа",
          ),
          const Divider(
            color: AppColors.greyButton,
          ),
          const SettingsWidget(
            icon: Icons.question_answer,
            title: "Вопросы и ответы",
          ),
          const Divider(
            color: AppColors.greyButton,
          ),
          const SettingsWidget(
            icon: Icons.rule_sharp,
            title: "Условия пользования",
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Обратная связь",
            style: AppTextStyles.s16w500montserrat,
          ),
          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
            child: Text(
              "Оставить отзыв",
              style: AppTextStyles.s14w500montserrat.copyWith(color: AppColors.primary),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
            child: Text(
              "Свяжись с нами",
              style: AppTextStyles.s14w500montserrat.copyWith(color: AppColors.primary),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
            child: Text(
              "О нас",
              style: AppTextStyles.s14w500montserrat.copyWith(color: AppColors.primary),
            ),
          ),
        ]),
      ),
    );
  }
}

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5).r,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 25,
                  color: AppColors.greyDark,
                ),
                SizedBox(
                  width: 30.w,
                ),
                Text(title, style: AppTextStyles.s18w700montserrat.copyWith(fontWeight: FontWeight.w600)),
              ],
            ),
            Icon(
              Icons.navigate_next,
              color: Colors.grey.shade700,
              size: 25,
            )
          ],
        ),
      ),
    );
  }
}
