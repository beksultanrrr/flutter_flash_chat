import 'package:cached_network_image/cached_network_image.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/core/constants/color_constants.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late Animation animation;

  @override
  void initState() {
    super.initState();

    // animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);   Curves class animation

    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    //   print(status);
    // });
  }

 

  void toLoginScreen(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  void toRegistrationScreen(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: CachedNetworkImage(width: 80.h, height: 100.h, imageUrl: "https://www.kaznu.kz/content/images/pages/25775.jpg"),
                ),
                TypewriterAnimatedTextKit(
                  speed: const Duration(milliseconds: 500),
                  text: const ["Мейрімділік"],
                  textStyle: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900, color: AppColors.primary),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                buttonColor: kLogInButtonColor,
                buttonTitle: "Вход",
                onPressed: () {
                  toLoginScreen(context);
                }),
            RoundedButton(
                buttonColor: kRegisterButtonColor,
                buttonTitle: "Зарегистрироватьcя",
                onPressed: () {
                  toRegistrationScreen(context);
                })
          ],
        ),
      ),
    );
  }
}
