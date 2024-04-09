import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flash_chat/core/constants/app_text_styles.dart';
import 'package:flash_chat/screens/main_page/main_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SuccessPay extends StatelessWidget {
  final isSavedCard;
  const SuccessPay({super.key, this.isSavedCard = true});
  void toMainPage(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage()));
  }

  void popIsSavedFalse(context) {
    Navigator.of(context)
      ..pop()
      ..pop()
      ..pop();
  }

  void popIsSavedTrue(context) {
    Navigator.of(context)
      ..pop()
      ..pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).r,
          child: Column(
            children: [
              SizedBox(
                // height: 200.h,
                // width: 200.w,
                child: Lottie.asset('assets/animations/animation.json'),
              ),
              Text(
                textAlign: TextAlign.center,
                "Благодарим за ваше доброе сердце и поддержку! Ваше пожертвование помогает тем, кто нуждается. Спасибо за ваш вклад в наше дело. Вместе мы можем сделать больше!",
                style: AppTextStyles.s18w500inter,
              ),
              SizedBox(height: 40.h),
              SizedBox(
                height: 40.h,
                child: ElevatedButton(
                    onPressed: () => isSavedCard ? popIsSavedFalse(context) : popIsSavedTrue(context),

                    //  () {

                    // Navigator.of(context)
                    //   ..pop()
                    //   ..pop();
                    // } :

                    child: Center(
                      child: Text(
                        "На главную",
                        style: AppTextStyles.s16w500montserrat,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
