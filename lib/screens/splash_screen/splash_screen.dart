import 'package:cached_network_image/cached_network_image.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/core/constants/color_constants.dart';
import 'package:flash_chat/screens/authorization/authorization_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const WelcomeScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(30.0), child: CachedNetworkImage(fit: BoxFit.cover, width: 150.h, height: 150.h, imageUrl: "https://www.kaznu.kz/content/images/pages/25775.jpg")),
          SizedBox(
            height: 50.h,
          ),
          Text(
            "Мейрімділік",
            style: theme.textTheme.titleLarge!.copyWith(color: Colors.white, fontSize: 35, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Қайрымдылық қоры",
            style: theme.textTheme.titleMedium!.copyWith(color: Colors.white, fontSize: 20),
          )
        ],
      )),
    );
  }
}
