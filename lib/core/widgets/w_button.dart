// import 'package:final_exam/assets/colors.dart';
// import 'package:flutter/cupertino.dart';
//
// class WButton extends StatelessWidget {
//   final Function() onTap;
//   final String text;
//   final bool isDisabled;
//   final bool isLoading;
//   final TextStyle? style;
//   final Color? buttonColor;
//   final EdgeInsets? padding;
//   final EdgeInsets? margin;
//   final double? width;
//   final double? height;
//   final Widget? child;
//   const WButton({
//     required this.onTap,
//     this.isDisabled = false,
//     this.isLoading = false,
//     this.text = '',
//     this.style,
//     this.buttonColor,
//     this.margin,
//     this.padding,
//     this.height,
//     this.width,
//     this.child,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (!isDisabled && !isLoading) {
//           onTap()
//           ;
//         }
//       },
//       child: Container(
//         height: height,
//         width: width ?? double.maxFinite,
//         alignment: Alignment.center,
//         margin: margin ?? EdgeInsets.zero,
//         padding: padding ?? const EdgeInsets.symmetric(vertical: 15),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: isDisabled ? boxColor.withOpacity(.3) : buttonColor ?? boxColor,
//         ),
//         child: Builder(
//           builder: (_) {
//             if (isLoading) {
//               return const CupertinoActivityIndicator();
//             }
//             if (child == null) {
//               print('text not a null text -- $text');
//               return Text(
//                 text,
//                 style: style ??
//                     TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: isDisabled ? white.withOpacity(.3) : white,
//                     ),
//               );
//             } else {
//               print('child not a null');
//               return child!;
//             }
//           },
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../assets/colors.dart';
import 'w_scale_animation.dart';


class WButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color color;
  final Color textColor;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final GestureTapCallback onTap;
  final Widget? child;
  final BoxBorder? border;
  final bool loading;
  final bool disabled;
  final double? borderRadius;
  final List<BoxShadow>? boxShadow;
  const WButton({
    required this.onTap,
    this.width,
    this.borderRadius,
    this.height,
    this.text = '',
    this.textStyle,
    this.margin,
    this.padding,
    this.border,
    this.child,
    this.boxShadow,
    this.color = const Color(0xff0062FF),
    this.textColor = white,
    this.loading = false,
    this.disabled = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
    onTap: () {
      if (!(loading || disabled)) {
        onTap();
      }
    },
    isDisabled: disabled,
    child: Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding ?? const EdgeInsets.all(14),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: disabled ? secondary : color,
          borderRadius: BorderRadius.circular(borderRadius ?? 4),
          border: border,
          boxShadow: boxShadow),
      child: loading
          ? const Center(
        child: CupertinoActivityIndicator(),
      )
          : child ??
          Text(
            text.trim(),
            style: textStyle ??
                Theme.of(context).textTheme.headline3!.copyWith(
                  color: textColor,
                  fontSize: 16,
                ),
          ),
    ),
  );
}
