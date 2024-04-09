import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flash_chat/core/components/app_bottom_navigation.dart';
import 'package:flash_chat/screens/main_page/main_page.dart';
import 'package:flash_chat/screens/profile_screen/profile_screen.dart';
import 'package:flash_chat/screens/saved_screen/saved_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return AppBottomNavigation(
      pages: const [MainPage(), SavedScreen(), ChatScreen(), ProfileScreen()],
      names: const ['', '', ' ', '', ''],
      assetIcons: const [
        'assets/images/home.png',
        'assets/images/saved.png',
        'assets/images/chat.png',
        'assets/images/profile.png',
      ],
    );
  }
}
