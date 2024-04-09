// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// typedef InstrumentTapCallback = void Function(String name);

// class RowCardOptions extends StatelessWidget {
//   final bool isCanDelete;
//   final bool isNormal;
//   final bool isOptional;
//   final double normalFontSize;
//   final FontWeight normalFontWeight;
//   final bool isRadioButton;
//   final bool isNextButton;
//   final bool isCount;
//   final bool isDoneButton;
//   final bool isShares;
//   final bool isSwitchToggle;
//   final String title;
//   final bool isActiveToggle;
//   final bool isActiveRadio;
//   final bool isLogout;
//   final String count;
//   final ValueChanged<bool>? onChanged;
//   final ValueChanged<String>? onTextChanged;
//   final Function? onTap;
//   final int sharesCount;
//   final bool isTextField;
//   final bool isHintText;
//   final bool isTextWIthBlinking;
//   final bool blinkingForTextWIthBlinking;
//   final bool isMoney;
//   final String money;
//   final double textFieldContainerSize;
//   final bool isForReplenishment;
//   final String subtitle;
//   final TextEditingController? controller;
//   final bool? isPurple;
//   final bool isButtonGrey;
//   final bool isDropdown;
//   final Widget? dropdownButtonWidget;


//   const RowCardOptions({
//     super.key,
//     this.isRadioButton = false,
//     this.isNextButton = false,
//     this.isCount = false,
//     this.isDoneButton = false,
//     this.isShares = false,
//     this.isSwitchToggle = false,
//     required this.title,
//     this.isActiveRadio = false,
//     this.isActiveToggle = false,
//     this.count = '0',
//     this.onChanged,
//     this.onTap,
//     this.sharesCount = 0,
//     this.isLogout = false,
//     this.isTextField = false,
//     this.isMoney = false,
//     this.money = '0',
//     this.textFieldContainerSize = 1,
//     this.isHintText = false,
//     this.isTextWIthBlinking = false,
//     this.blinkingForTextWIthBlinking = false,
//     this.isForReplenishment = false,
//     this.subtitle = '',
//     this.onTextChanged,
//     this.controller,
//     this.isNormal = false,
//     this.normalFontSize = 16,
//     this.normalFontWeight = FontWeight.w600,
//     this.isCanDelete = false,
//     this.isOptional = false,
//     this.isPurple,
//     this.isButtonGrey = false,
//     this.isDropdown = false,
//     this.dropdownButtonWidget,
   
//   });

//   Stream<bool> _cursorBlinkStream() {
//     return Stream.periodic(const Duration(milliseconds: 500), (i) => i % 2 == 0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isTextField) {
//       return Container(
    
//         margin: const EdgeInsets.only(top: 1).r,
//         width: textFieldContainerSize.sw,
//         // height: 56.h,
//         child: TextField(
//           onChanged: onTextChanged,
//           controller: controller,
//           textAlign: TextAlign.center,
//           cursorColor: PaidaxColors.secondaryText,
//           style: const TextStyle(
//             color: PaidaxColors.secondaryText,
//           ),
//           decoration: InputDecoration(
//             hintText: title,
//             hintStyle: const TextStyle(
//               color: PaidaxColors.secondaryText,
//             ),
//             border: InputBorder.none,
//           ),
//         ),
//       );
//     } else if (isHintText) {
//       return InkWell(
      
//         splashColor: const Color(0x00e8e8e8),
//         highlightColor: Colors.transparent,
//         onTap: () {
//           onTap!();
 
//         },
//         child: Container(
        
//           margin: const EdgeInsets.only(top: 1).r,
//           padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16).r,
//           // height: 56.h,
//           width: textFieldContainerSize.sw,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 16.sp,
//                   color: isLogout ? PaidaxColors.failingBg : PaidaxColors.primaryText,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     } else if (isTextWIthBlinking) {
//       return InkWell(
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         onTap: () {
//           onTap!();
     
//         },
//         child: Container(
//           margin: const EdgeInsets.only(top: 1).r,
//           padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16).r,
//           // height: 56.h,
//           width: textFieldContainerSize.sw,
//           child: Row(
//             children: [
//               blinkingForTextWIthBlinking
//                   ? StreamBuilder<bool>(
//                       stream: _cursorBlinkStream(),
//                       initialData: true,
//                       builder: (context, snapshot) {
//                         final bool isCursorVisible = snapshot.data ?? true;
//                         final textToDisplay = isCursorVisible ? '${title.substring(0, title.length)}|' : title;
//                         return Text(
//                           textToDisplay,
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             color: isLogout ? PaidaxColors.failingBg : PaidaxColors.primaryText,
//                           ),
//                         );
//                       },
//                     )
//                   : Text(
//                       title,
//                       style: TextStyle(
//                         fontSize: 16.sp,
//                         color: isLogout ? PaidaxColors.failingBg : PaidaxColors.primaryText,
//                       ),
//                     ),
//               const Spacer(),
//             ],
//           ),
//         ),
//       );
//     } else {
//       return InkWell(
//         onTap: () {
//           onTap != null ? {onTap!(), context.vibrate()} : () {};
//         },
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         child: Container(
//           margin: const EdgeInsets.only(top: 1).r,
//           padding: const EdgeInsets.symmetric(vertical: 10).r,
//           // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16).r,
//           width: textFieldContainerSize.sw,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: isLogout ? PaidaxColors.failingBg : PaidaxColors.primaryText)),
//               ),
//               // const Spacer(),
//               if (isCanDelete)
//                 InkWell(
//                   onTap: () {
//                     onTap!();
//                     context.vibrate();
//                   },
//                   child: SizedBox(
//                     height: 22.r,
//                     width: 22.r,
//                     child: SvgPicture.asset(
//                       'assets/images/trash.svg',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               if (isForReplenishment)
//                 Text(
//                   subtitle,
//                   style: TextStyle(
//                     color: PaidaxColors.secondaryText,
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               if (isNormal) ...[
//                 SizedBox(width: 5.w),
//                 Expanded(
//                   child: Text(
//                     subtitle,
//                     textAlign: TextAlign.end,
//                     style: TextStyle(
//                       fontSize: normalFontSize,
//                       fontWeight: normalFontWeight,
//                       color: isPurple != null
//                           ? !isPurple!
//                               ? Colors.black
//                               : Theme.of(context).colorScheme.primary
//                           : Colors.black,
//                     ),
//                   ),
//                 ),
//               ],
//               if (isRadioButton)
//                 InkWell(
//                   onTap: () {
//                     onTap!();
//                     // context.vibrate();
//                   },
//                   child: isActiveRadio
//                       ? Icon(
//                           Icons.radio_button_checked,
//                           // color: const Color(0xFF5C76FF),
//                           color: primary,
//                           size: 17.r,
//                         )
//                       : Icon(
//                           Icons.radio_button_off,
//                           size: 17.r,
//                           color: PaidaxColors.grey,
//                         ),
//                 ),
//               if (isNextButton)
//                 InkWell(
//                   onTap: () {
//                     onTap!();
//                     context.vibrate();
//                   },
//                   child: Icon(
//                     Icons.arrow_forward_ios,
//                     size: 17.r,
//                   ),
//                 ),
//               if (isMoney)
//                 Text(
//                   '\$$money',
//                   style: Theme.of(context).textTheme.displayLarge,
//                 ),
//               if (isCount)
//                 InkWell(
//                   onTap: () {
//                     onTap!();
//                     context.vibrate();
//                   },
//                   child: Text(
//                     count,
//                     style: Theme.of(context).textTheme.displayLarge,
//                   ),
//                 ),
//               if (isSwitchToggle)
//                 CupertinoSwitch(
//                   value: isActiveToggle,
//                   // activeColor: const Color(0xFF4B43FA),
//                   activeColor: Theme.of(context).colorScheme.primary,
//                   onChanged: onChanged,
//                 ),
//               if (isDropdown)
//                 if (dropdownButtonWidget != null) dropdownButtonWidget!,
//               if (isShares)
//                 Container(
//                   alignment: Alignment.center,
//                   height: 24.h,
//                   width: 52.w,
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).colorScheme.background,
//                     borderRadius: BorderRadius.circular(10).r,
//                   ),
//                   child: Text(
//                     '$sharesCount',
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       color: Theme.of(context).colorScheme.primary,
//                     ),
//                   ),
//                 ),
//               if (isDoneButton)
//                 InkWell(
//                   onTap: () {
//                     onTap!();
//                     context.vibrate();
//                   },
//                   child: isActiveRadio
//                       ? Icon(
//                           Icons.done,
//                           color: Theme.of(context).colorScheme.primary,
//                         )
//                       : Icon(
//                           Icons.done,
//                           color: Theme.of(context).colorScheme.primary,
//                         ),
//                 ),
//             ],
//           ),
//         ),
//       );
//     }
//   }
// }
