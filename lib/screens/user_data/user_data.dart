import 'package:flutter/material.dart';
import 'package:flash_chat/core/widgets/user_autorization.dart';
import 'package:flash_chat/screens/home_page/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});
  void goMainPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return UserAutorizationScreen(
      label: t.enterUDetails,
      number: false,
      navigate: () => goMainPage(context),
    );
  }
}
