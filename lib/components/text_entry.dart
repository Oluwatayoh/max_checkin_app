import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextEntryComponent extends StatefulWidget {
  TextEntryComponent(
      {Key? key,
      required this.text,
      this.textColor,
      this.suffix,
      this.prefix,
      required this.controller,
      this.onChanged,
      this.enabled,
      this.isNumeric,
      this.fontSize,
      this.obscureText = false,
      this.inputType,
      this.maxLength,
      this.inputColor,
      this.backgroundColor,
      this.hintText})
      : super(key: key);
  final String text;
  final String? hintText;
  final Widget? suffix;
  final Widget? prefix;
  final bool? enabled;
  final bool? isNumeric;
  final Color? textColor;
  final bool obscureText;
  final double? fontSize;
  final Color? inputColor;
  final int? maxLength;
  final Color? backgroundColor;
  final TextInputType? inputType;
  final Function(void)? onChanged;
  final TextEditingController controller;
  @override
  State<TextEntryComponent> createState() => _TextEntryComponentState();
}

class _TextEntryComponentState extends State<TextEntryComponent> {
  // final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 10,
        ),
        widget.text == "" || widget.text == null
            ? SizedBox()
            : SizedBox(
                width: double.infinity,
                child: Text(
                  widget.text,
                  style: GoogleFonts.nunito(
                      fontSize: 14.sp, color: widget.textColor ?? Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
        SizedBox(
          height: 5,
        ),
        widget.isNumeric == true
            ? TextField(
                cursorColor: Color.fromARGB(255, 4, 86, 118),
                controller: widget.controller,
                onChanged: widget.onChanged,
                style: GoogleFonts.nunito(fontSize: 12.sp),
                enabled: widget.enabled ?? true,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11),
                ],
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: Theme.of(context).iconTheme.color!,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0),
                    ),
                    fillColor: Theme.of(context).backgroundColor,
                    filled: true,
                    isDense: true,
                    hintText: widget.hintText,
                    border: const OutlineInputBorder(),
                    suffixIcon: widget.suffix),
              )
            : TextField(
                cursorColor: const Color(0xff04764E),
                controller: widget.controller,
                onChanged: widget.onChanged,
                style: GoogleFonts.nunito(
                    fontSize: widget.fontSize ?? 12.sp,
                    color: widget.inputColor ?? Colors.black),
                enabled: widget.enabled ?? true,
                keyboardType: widget.inputType,
                obscureText: widget.obscureText,
                maxLength: widget.maxLength,

                //  textInputType: TextInputType.number,
                decoration: InputDecoration(
                    counterText: '',
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0),
                    ),
                    fillColor: widget.backgroundColor ??
                        Theme.of(context).backgroundColor,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.sp,
                    ),
                    // contentPadding: EdgeInsets.only(bottom: .sp),
                    hintText: widget.hintText,
                    prefixIcon: widget.prefix,
                    border: const OutlineInputBorder(),
                    suffixIcon: widget.suffix),
              )
      ],
    );
  }
}
