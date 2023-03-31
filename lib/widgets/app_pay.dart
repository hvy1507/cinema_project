import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class AppPay extends StatefulWidget {
  const AppPay({
    super.key,
    required this.logo,
    required this.namePay,
  });

  final String logo;
  final String namePay;

  @override
  State<AppPay> createState() => _AppPayState();
}

class _AppPayState extends State<AppPay> {
  var _isGroup = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xffffffff).withOpacity(0.06),
              border: GradientBoxBorder(
                  gradient: LinearGradient(colors: [
                    const Color(0xff5FFFCA),
                    const Color(0xff60FFCA).withOpacity(0),
                    const Color(0xff60FFCA).withOpacity(0),
                    const Color(0xff60FFCA),
                  ]),
                  width: 2)),
          child: Padding(
            padding: const EdgeInsets.only(left: 26, top: 24, bottom: 24),
            child: Row(
              children: [
                Expanded(flex: 1, child: Image.asset(widget.logo,height: 46,fit: BoxFit.fill,)),
                const SizedBox(
                  width: 17,
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    widget.namePay,
                    style:
                    AppFonts.poppins500(22,const Color(0xffffffff)).copyWith(height: 27/22),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Radio(
                      activeColor: const Color(0xff60FFCA),
                      value: 1,
                      groupValue: _isGroup,
                      onChanged: (newValue) {
                        setState(() {
                          _isGroup = int.parse(newValue.toString());
                        });
                      }),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}
