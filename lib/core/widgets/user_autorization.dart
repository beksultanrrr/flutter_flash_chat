// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flash_chat/core/constants/app_text_styles.dart';
import 'package:flash_chat/core/constants/color_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserAutorizationScreen extends StatelessWidget {
  final String label;
  final bool number;
  final Function()? navigate;
  UserAutorizationScreen({
    super.key,
    required this.label,
    required this.number,
    this.navigate,
  });
  final maskFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
  );
  final FocusNode _focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 109, left: 16, right: 16),
          child: Column(children: [
            Text(label, style: AppTextStyles.s16w700montserrat),
            const SizedBox(
              height: 48,
            ),
            number
                ? Flexible(
                    child: TextField(
                    focusNode: _focusNode,
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: '+7',
                    ),
                    inputFormatters: [maskFormatter],
                  ))
                : TextField(
                    decoration: InputDecoration(
                      hintText: t.name,
                    ),
                  ),
            const SizedBox(
              height: 18,
            ),
            if (number == false)
              const TextField(
                decoration: InputDecoration(
                  hintText: 'E-mail',
                ),
              ),
          ]),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 283.h,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 28, left: 42, right: 42).r,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: AppTextStyles.s11w500montserrat.copyWith(color: AppColors.primary),
                      /*defining default style is optional */
                      children: <TextSpan>[
                        TextSpan(text: 'Нажимая на кнопку, вы соглашаетесь с', style: AppTextStyles.s12w500montserrat.copyWith(color: AppColors.greyBanner)),
                        TextSpan(text: ' условиями ', style: AppTextStyles.s11w500montserrat.copyWith(color: AppColors.primary)),
                        TextSpan(
                          text: ' и ',
                          style: AppTextStyles.s12w500montserrat.copyWith(color: AppColors.greyBanner),
                        ),
                        const TextSpan(
                          text: ' политикой конфиденциальности',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 62.0),
            child: SizedBox(width: double.infinity, height: 46, child: ElevatedButton(onPressed: navigate, child: Text("Войти", style: theme.textTheme.titleMedium!.copyWith(color: Colors.white)))),
          ),
        ),
      ],
    ));
  }
}
