import 'package:flutter/material.dart';
import 'package:flash_chat/core/constants/app_text_styles.dart';
import 'package:flash_chat/core/constants/color_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
      primaryColor: AppColors.primary,
      primarySwatch: Colors.red,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        // backgroundColor: AppColors.primary,
        disabledForegroundColor: AppColors.primary,
        // disabledBackgroundColor: AppColors.textGrey3,
        textStyle: AppTextStyles.s12w700montserrat.copyWith(color: AppColors.primary),
      )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
        backgroundColor: AppColors.primary,
        disabledForegroundColor: AppColors.white,
        disabledBackgroundColor: AppColors.textGrey3,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        textStyle: AppTextStyles.s18w500inter.copyWith(color: Colors.white),
      )),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(
          color: AppColors.textGrey1,
        ),
        backgroundColor: AppColors.white,
        elevation: 1,
        centerTitle: true,
        titleTextStyle: AppTextStyles.s18w500inter.copyWith(fontSize: 16.sp),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 10,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,
        type: BottomNavigationBarType.fixed,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primary,
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      unselectedWidgetColor: AppColors.grey);
}
