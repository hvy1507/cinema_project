import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/network/api_request.dart';
import 'package:flutter_cinema_app/network/apibase/api_response.dart';
import 'package:flutter_cinema_app/provider/user.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/app_textfield.dart';
import 'package:flutter_cinema_app/widgets/back_button.dart';
import 'package:flutter_cinema_app/widgets/custom_dialog.dart';
import 'package:flutter_cinema_app/widgets/item_gradient.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/app_routes.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, userData, child) {
      return Scaffold(
        backgroundColor: const Color(0xff130B2B),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 1,
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const AppBackButton(),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  alignment: Alignment.center,
                  child: (Image.asset(AppImages.appLogo)),
                ),
                Container(
                  alignment: Alignment.center,
                  child: (Text(
                    S.of(context).createAccount,
                    style: const TextStyle(fontSize: 35, color: Colors.white),
                  )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: AppTextField(
                    controller: phone,
                    hintText: "Nhập SĐT",
                    icon: AppImages.iconEmail,
                    isIcon: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: AppTextField(
                    controller: password,
                    hintText: "Nhập mật khẩu",
                    icon: AppImages.iconPassword,
                    isPassword: true,
                    isIcon: true,
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
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Container(
                        child: (Text(
                          S.of(context).remember,
                          style: const TextStyle(color: Colors.white),
                        )),
                      )
                    ],
                  ),
                ),
                AppButton(
                  onTap: () async {
                    if (phone.text.isEmpty || password.text.isEmpty) {
                      showMyDialog(
                        context,
                        title: "Thông báo",
                        content:
                            "Bạn vui lòng không để trống mật khẩu hoặc số điện thoại đăng ký",
                        noButton: false,
                      );
                    } else {
                      ApiResponse res = await ApiRequest.register(
                          password.text.trim(), phone.text.trim());
                      if (res.result == true) {
                        String token = res.data["accessToken"];
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setString('jwt', token);
                        showMyDialog(
                          context,
                          title: "Thông báo",
                          content: "Tạo tài khoản thành công",
                          noButton: true,
                        );
                        userData.idUser(res.data['id'].toString());
                        Future.delayed(const Duration(seconds: 5), () {
                          Navigator.pushNamed(
                              context, AppRoutes.chooseLocation);
                        });
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
                  titleButton: S.of(context).signup,
                ),

                Container(
                  margin: const EdgeInsets.only(top: 25),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(top: 3),
                          height: 0.5,
                          color: const Color(0xffA00D6A),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: (Text(
                            S.of(context).orcontinue,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          )),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(top: 3),
                          height: 0.5,
                          color: const Color(0xffA00D6A),
                        ),
                      ),
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
                          child: ItemGradient(icon: AppImages.iconFacebook),
                        ),
                        Expanded(
                          flex: 1,
                          child: ItemGradient(icon: AppImages.iconGoogle),
                        ),
                        Expanded(
                          flex: 1,
                          child: ItemGradient(
                            icon: AppImages.iconApple,
                          ),
                        ),
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
                      Text(
                        S.of(context).already,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.loginScreen);
                        },
                        child: Container(
                          child: (Text(
                            S.of(context).signin,
                            style: const TextStyle(
                                color: Color(0xffDF1893),
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
