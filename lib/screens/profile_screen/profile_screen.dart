// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flash_chat/screens/main_page/main_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flash_chat/core/constants/app_text_styles.dart';
import 'package:flash_chat/core/constants/color_constants.dart';
import 'package:flash_chat/screens/settings_screen/settings_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

const String url = "http://play.google.com/store/apps/details?id=";
const String packageName = "com.rateuse";

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, r});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ScrollController controller = ScrollController();

  ScrollPhysics _physics = const ClampingScrollPhysics();

  ScrollPageController? imageController;

  bool isChange = false;

  bool? isChanged;
  bool _hasCallSupport = false;
  Future<void>? _launched;
  @override
  void initState() {
    isChanged = false;
    imageController = ScrollPageController();
    super.initState();
    controller.addListener(() async {
      if (controller.position.pixels < 10) {
        setState(() {
          isChange = false;
        });
        setState(() => _physics = const ClampingScrollPhysics());
      } else {
        setState(() => _physics = const BouncingScrollPhysics());
      }
    });

    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  _launchWhatsapp() async {
    var whatsapp = "+77082224709";
    var whatsappAndroid = Uri.parse("whatsapp://send?phone=$whatsapp&text=Здравствуйте пишу с приложения AutoTap, хотел спросить насчет аренды Kia K5");

    await launchUrl(whatsappAndroid);
  }

  final Uri toLaunch = Uri(scheme: 'https', host: 'wa.me', path: '+77082224709?text=Здравствуйте пишу с приложения AutoTap, хотел спросить насчет аренды Kia K5');

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  void toSettingsScreen(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsScreen()),
    );
  }

  // Future _launchUrl() async {
  //   final Uri url = Uri.parse(url + packageName);
  //   if (!await launchUrl(url)) {
  //     throw Exception('Could not launch $url');
  //   }
  // }

  final _dialog = RatingDialog(
    initialRating: 1.0,
    // your app's name?
    title: const Text(
      'Rating Dialog',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    // encourage your user to leave a high rating?
    message: const Text(
      'Tap a star to set your rating. Add more description here if you want.',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ),
    // your app's logo?
    image: const FlutterLogo(size: 100),
    submitButtonText: 'Submit',
    commentHint: 'Set your custom comment hint',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');

      // TODO: add your own logic
      if (response.rating < 3.0) {
        // send their comments to your email or anywhere you wish
        // ask the user to contact you instead of leaving a bad review
      } else {
        // _launchUrl();
      }
    },
  );

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Scaffold(
        body: CustomScrollView(scrollDirection: Axis.vertical, physics: _physics, controller: controller, slivers: [
      SliverAppBar(
        toolbarHeight: 35,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        // title: Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
        pinned: true,
        expandedHeight: MediaQuery.of(context).size.height * 0.3,
        flexibleSpace: FlexibleSpaceBar(
          background: CachedNetworkImage(
            imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5BtiiXNirCanHelk5TcbLNvRnA8BnpBVhXw&usqp=CAU",
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1.0)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Column(
                      children: [
                        Text(
                          t.theCreatorOfChange,
                          style: AppTextStyles.s20w700montserrat,
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Text(
                          t.fromMarch,
                          style: AppTextStyles.s16w400montserrat.copyWith(color: AppColors.grey),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toSettingsScreen(context);
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.lightBlue,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3).r,
                          child: const Icon(
                            Icons.settings,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8).r,
                    color: AppColors.lightBlue,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10).r,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20).r,
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                    imageUrl:
                                        "https://images.ctfassets.net/z0x29akdg5eb/6z7HwkK7cOuYgBMjVdM4Of/c610ddb395cb91f94cfbe3eefeb35150/WFP_STM_Values_Illustrations_Open.png?w=136&h=136&fit=fill&q=80&fm=avif"),
                                Text(
                                  t.readyFightHunry,
                                  style: AppTextStyles.s14w600montserrat,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  t.startGivingCharity,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.s12w400montserrat.copyWith(
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              child: Center(
                                child: Text(
                                  t.doGoodFirstTime,
                                  style: AppTextStyles.s16w400montserrat,
                                ),
                              )),
                        ],
                      )),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.shareULove,
                      style: AppTextStyles.s14w500montserrat,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButtonWidget(
                          onTap: () {
                            shareContent(t.inviteSms('https://charity.kz'));
                          },
                          title: t.shareInformation,
                          icon: "https://raurban.ru/wp-content/uploads/2022/07/Dizajn-bez-nazvaniya1.png",
                        ),
                         IconButtonWidget(
                          title: t.sendGift,
                          icon: "https://telegram.org.ru/uploads/posts/2023-04/1681589050_1681589088.png",
                        ),
                        IconButtonWidget(
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierDismissible: true, // set to false if you want to force a rating
                              builder: (context) => _dialog,
                            );
                          },
                          title: t.rateUs,
                          icon: "https://www.iconpacks.net/icons/2/free-star-icon-2768-thumb.png",
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: SizedBox(height: 30.h),
      ),
    ]));
  }
}

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
  });
  final Function()? onTap;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: AppColors.darkBlue,
                borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(60), topLeft: Radius.circular(40), bottomLeft: Radius.circular(40))),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: CachedNetworkImage(width: 50, height: 50, imageUrl: icon),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            width: 100.w,
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              title,
              style: AppTextStyles.s12w500montserrat.copyWith(color: AppColors.grey),
            ),
          )
        ],
      ),
    );
  }
}
