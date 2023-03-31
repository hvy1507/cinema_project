import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/network/apibase/api_response.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/app_button_text.dart';
import 'package:flutter_cinema_app/widgets/app_textfield.dart';
import 'package:flutter_cinema_app/widgets/custom_dialog.dart';
import 'package:flutter_cinema_app/widgets/item_gradient.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:flutter_cinema_app/network/api_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isChecked = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff130B2B),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF).withOpacity(0.3),
                      shape: BoxShape.circle,
                      border: const GradientBoxBorder(
                          width: 2,
                          gradient: LinearGradient(
                              begin: FractionalOffset.topLeft,
                              end: FractionalOffset.bottomRight,
                              colors: [
                                Color(0xff60FFCA),
                                Color.fromRGBO(96, 255, 202, 0),
                                Color.fromRGBO(96, 255, 202, 0),
                                Colors.transparent
                              ],
                              stops: [0.3, 0.55, 0.8, 1],
                              transform: GradientRotation(pi / 6)))),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                alignment: Alignment.center,
                child: Image.asset(AppImages.appLogo),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  S.of(context).loginToAccount,
                  style: const TextStyle(fontSize: 35, color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: AppTextField(
                  controller: _phoneController,
                  hintText: 'Nhập SĐT',
                  icon: AppImages.iconEmail,
                  isIcon: true,
                ),
              ), // SĐT đăng nhập
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: AppTextField(
                  controller: _passwordController,
                  hintText: 'Nhập mật khẩu',
                  icon: AppImages.iconPassword,
                  isIcon: true,
                  isPassword: true,
                ),
              ), // PassWord
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => const Color(0xffB6116B)),
                      checkColor: Colors.white,
                      activeColor: const Color(0xffB6116B),
                      value: isChecked,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      S.of(context).remember,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              AppButton(
                titleButton: S.of(context).signin,
                onTap: () async {
                  if (_phoneController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    showMyDialog(
                      context,
                      title: "Thông báo",
                      content:
                          "Bạn vui lòng không để trống mật khẩu hoặc số điện thoại",
                      noButton: false,
                    );
                  } else {
                    ApiResponse res = await ApiRequest.userLogin(
                        _passwordController.text, _phoneController.text);
                    if (res.result == true) {
                      String token = res.data["data"]["accessToken"];
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString('jwt', token);
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.homePage);
                    } else {
                      showMyDialog(
                        context,
                        title: "Thông báo",
                        content: res.message ?? "",
                        noButton: true,
                      );
                    }
                  }
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  children: [
                    const Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Color.fromRGBO(160, 13, 106, 1),
                      height: 1.5,
                    )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            S.of(context).orcontinue,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        )),
                    const Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Color.fromRGBO(160, 13, 106, 1),
                      height: 1.5,
                    )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                height: 56,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Row(
                    children: const [
                      Expanded(
                          flex: 1,
                          child: ItemGradient(
                            icon: AppImages.iconFacebook,
                          )),
                      Expanded(
                          flex: 1,
                          child: ItemGradient(
                            icon: AppImages.iconGoogle,
                          )),
                      Expanded(
                          flex: 1,
                          child: ItemGradient(
                            icon: AppImages.iconApple,
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButtonText(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.paymentMethod);
                      },
                      text: S.of(context).already,
                      textColor: S.of(context).signup,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
