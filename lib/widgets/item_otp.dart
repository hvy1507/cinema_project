import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:gradient_borders/gradient_borders.dart';

class ItemOTP extends StatefulWidget {
  const ItemOTP({
    super.key,
    this.controller,
    required this.onChanged,
    required this.focusNode,
  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final FocusNode focusNode;

  @override
  _ItemOTPState createState() => _ItemOTPState();
}

class _ItemOTPState extends State<ItemOTP> {
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      setState(() {
        _isFocused = widget.focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: size.width * 1 / 5,
      decoration: BoxDecoration(
        border: GradientBoxBorder(
          width: 5,
          gradient: _isFocused ? AppTheme.pinkGradientBorder : AppTheme.greenGradient2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        focusNode: widget.focusNode,
        keyboardType: TextInputType.number,
        onChanged: widget.onChanged,
        maxLength: 1,
        controller: widget.controller,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 32,
          height: 48 / 32,
          letterSpacing: 0.03,
          color: Color(0xffffffff),
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          // focusedBorder: GradientOutlineInputBorder(
          //   gradient: AppTheme.pinkGradient2,
          //   width: 2,
          // ),
          // contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7)),
        ),
      ),
    );
  }
}
