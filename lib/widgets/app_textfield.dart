import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';

class AppTextField extends StatefulWidget {
  AppTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.isPassword = false,
    this.isObscureText = true,
    required this.isIcon,
    this.controller,
    this.gradientGreen,
    this.gradientPink, this.keyboardType,
  });
  final TextInputType? keyboardType;
  final String hintText;
  String? icon;
  final bool isPassword;
  final bool isIcon;
  bool isObscureText;
  TextEditingController? controller = TextEditingController();
  Gradient? gradientGreen;
  Gradient? gradientPink;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffffffff).withOpacity(0.2)),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        style: AppFonts.poppins500(17, AppTheme.white),
        controller: widget.controller,
        obscureText: widget.isPassword ? widget.isObscureText : false,
        focusNode: myFocusNode,
        decoration: InputDecoration(
            prefixIcon: widget.isIcon
                ? myFocusNode.hasFocus
                    ? Container(
                        margin: const EdgeInsets.only(left: 22),
                        child: Image.asset(
                          widget.icon ?? "",
                          width: 21,
                          height: 21,
                          color: AppTheme.pink,
                          alignment: Alignment.centerLeft,
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.only(left: 22),
                        child: Image.asset(
                          widget.icon ?? "",
                          width: 21,
                          height: 21,
                          alignment: Alignment.centerLeft,
                        ),
                      )
                : null,
            hintText: widget.hintText,
            hintStyle: AppFonts.poppins500(17, AppTheme.gray),
            border: GradientOutlineInputBorder(
                gradient: AppTheme.inputGradient,
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: GradientOutlineInputBorder(
                gradient: AppTheme.inputGradientFocus,
                borderRadius: BorderRadius.circular(20)),
            contentPadding:
                const EdgeInsets.only(left: 24, top: 15, bottom: 15),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.isObscureText = !widget.isObscureText;
                      });
                    },
                    child: !widget.isObscureText
                        ? Icon(
                            Icons.visibility,
                            color: myFocusNode.hasFocus
                                ? AppTheme.pink
                                : AppTheme.gray,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: myFocusNode.hasFocus
                                ? AppTheme.pink
                                : AppTheme.gray,
                          ))
                : null),
      ),
    );
  }
}
