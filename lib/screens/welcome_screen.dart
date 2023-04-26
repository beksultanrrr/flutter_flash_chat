import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/buttons.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      //upperBound: 100,
    );

    // animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);   Curves class animation

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller); //Tween class animation for Colors

    controller.forward();
    // controller.reverse(from: 1)

    controller.addListener(() {
      setState(() {});
      // print(animation.value * 100);
    });

    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    //   print(status);
    // });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60, //animation.value * 100,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: const Duration(milliseconds: 500),
                  text: ["Flash Chat"],
                  textStyle: const TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                buttonColor: kLogInButtonColor,
                buttonTitle: "Log In",
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            RoundedButton(
                buttonColor: kRegisterButtonColor,
                buttonTitle: "Register",
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                })
          ],
        ),
      ),
    );
  }
}
