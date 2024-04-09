import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/core/services/helper.dart';
import 'package:flash_chat/model/locale.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

enum SampleItem { itemOne, itemTwo }

class LanguageSettings extends StatefulWidget {
  const LanguageSettings({super.key});

  @override
  State<LanguageSettings> createState() => _LanguageSettingsState();
}

class _LanguageSettingsState extends State<LanguageSettings> {
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    var selectedLocale = Localizations.localeOf(context).toString();
    return Scaffold(
      appBar: AppBar(title: Text(t.enterYourNumber)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).r,
        child: Column(
          children: [
            Consumer<LocaleModel>(builder: (context, localeModel, child) {
              return Column(
                children: [
                  RowCardOptions(
                    title: "Казахский",

                    isActiveRadio: selectedLocale == 'kk',
                    // isDoneButton: context.read<ApplicationBloc>().state.maybeMap(orElse: () {
                    //   return false;
                    // }, loaded: (state) {
                    //   return state.language.languageCode == "ru";
                    // }),
                    onTap: () {
                      setState(() {
                        localeModel.set(const Locale("kk"));
                      });
                    },
                  ),
                  RowCardOptions(
                    title: "Русский",

                    isActiveRadio: selectedLocale == 'ru',

                    // }),
                    onTap: () {
                      setState(() {
                        localeModel.set(const Locale("ru"));
                      });
                    },
                  ),
                  RowCardOptions(
                    title: "Английский",

                    isActiveRadio: selectedLocale == 'en',

                    // }),
                    onTap: () {
                      setState(() {
                        localeModel.set(const Locale("en"));
                      });
                    },
                  ),
                ],
              );
            }

                // DropdownButton(
                //   value: selectedLocale,
                //   items: const [
                //     DropdownMenuItem(
                //       value: "en",
                //       child: Text("English"),
                //     ),
                //     DropdownMenuItem(
                //       value: "kz",
                //       child: Text("RUS"),
                //     ),
                //     DropdownMenuItem(
                //       value: "ru",
                //       child: Text("GAP"),
                //     ),
                //   ],
                //   onChanged: (String? value) {
                //     if (value != null) {
                //       localeModel.set(Locale(value));
                //     }
                //   },
                // ),
                ),
          ],
        ),
      ),
    );
  }
}

typedef InstrumentTapCallback = void Function(String name);

class RowCardOptions extends StatelessWidget {
  final bool isCanDelete;
  final bool isNormal;
  final bool isOptional;
  final double normalFontSize;
  final FontWeight normalFontWeight;
  final bool isRadioButton;
  final bool isNextButton;
  final bool isCount;
  final bool isDoneButton;
  final bool isShares;
  final bool isSwitchToggle;
  final String title;
  final bool isActiveToggle;
  final bool isActiveRadio;
  final bool isLogout;
  final String count;
  final ValueChanged<bool>? onChanged;
  final ValueChanged<String>? onTextChanged;
  final Function() onTap;
  final int sharesCount;
  final bool isTextField;
  final bool isHintText;
  final bool isTextWIthBlinking;
  final bool blinkingForTextWIthBlinking;
  final bool isMoney;
  final String money;
  final double textFieldContainerSize;
  final bool isForReplenishment;
  final String subtitle;
  final TextEditingController? controller;
  final bool? isPurple;
  final bool isButtonGrey;
  final bool isDropdown;
  final Widget? dropdownButtonWidget;

  const RowCardOptions({
    super.key,
    this.isRadioButton = false,
    this.isNextButton = false,
    this.isCount = false,
    this.isDoneButton = false,
    this.isShares = false,
    this.isSwitchToggle = false,
    required this.title,
    this.isActiveRadio = false,
    this.isActiveToggle = false,
    this.count = '0',
    this.onChanged,
    required this.onTap,
    this.sharesCount = 0,
    this.isLogout = false,
    this.isTextField = false,
    this.isMoney = false,
    this.money = '0',
    this.textFieldContainerSize = 1,
    this.isHintText = false,
    this.isTextWIthBlinking = false,
    this.blinkingForTextWIthBlinking = false,
    this.isForReplenishment = false,
    this.subtitle = '',
    this.onTextChanged,
    this.controller,
    this.isNormal = false,
    this.normalFontSize = 16,
    this.normalFontWeight = FontWeight.w600,
    this.isCanDelete = false,
    this.isOptional = false,
    this.isPurple,
    this.isButtonGrey = false,
    this.isDropdown = false,
    this.dropdownButtonWidget,
  });

  Stream<bool> _cursorBlinkStream() {
    return Stream.periodic(const Duration(milliseconds: 500), (i) => i % 2 == 0);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(top: 1).r,
        padding: const EdgeInsets.symmetric(vertical: 10).r,
        // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16).r,
        width: textFieldContainerSize.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
            ),
            // const Spacer(),

            isActiveRadio
                ? Icon(
                    Icons.done,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
