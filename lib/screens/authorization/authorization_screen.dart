import 'package:flash_chat/core/widgets/user_autorization.dart';
import 'package:flash_chat/screens/user_data/user_data.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MobileNumber extends StatelessWidget {
  const MobileNumber({super.key});
  void goUserData(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserData()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return UserAutorizationScreen(
      label: t.enterYourNumber,
      number: true,
      navigate: () {
        goUserData(context);
      },
    );
  }
}
