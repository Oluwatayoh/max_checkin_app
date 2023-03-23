// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  // Widget? child;
  String? buttonText;
  double? height;
  double? width;
  Color? color;
  Color? textColor;
  Color? backgroundColor;
  Color? borderColor;
  FontWeight? fontWeight;
  double? borderWidth;
  double? wordSpacing;
  double? radius;
  double? fontSize;
  bool? isIconBtn;
  bool? disabled;
  Widget? icon;
  EdgeInsets? padding;
  Function()? onTap;

  CustomButton(
      {Key? key,
      this.onTap,
      this.isIconBtn,
      this.height,
      this.width,
      this.color,
      this.fontWeight,
      this.backgroundColor,
      this.borderColor,
      this.borderWidth,
      this.radius,
      this.fontSize,
      this.textColor,
      this.disabled,
      this.padding,
      this.icon,
      this.wordSpacing = 5.0,
      @required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled! ? null : onTap,
      child: Container(
        padding: padding ?? EdgeInsets.all(10),
        height: height ?? 40.h,
        width: width ?? 250.w,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(50),
          border: Border.all(
              width: borderWidth ?? 0,
              color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(radius ?? 50.0),
          color: disabled!
              ? Colors.grey.shade500
              : backgroundColor ?? Theme.of(context).iconTheme.color,
        ),
        child: Center(
          child: isIconBtn == true
              ? icon
              : Text(
                  buttonText == "" || buttonText == null
                      ? ""
                      : buttonText.toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunitoSans(
                    fontSize: fontSize ?? 16.sp,
                    fontWeight: fontWeight ?? FontWeight.normal,
                    color: textColor ?? Colors.white,
                  )),
        ),
      ),
    );
  }
}
