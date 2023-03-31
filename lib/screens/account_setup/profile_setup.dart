import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/provider/provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/custom_dialog.dart';
import 'package:flutter_cinema_app/widgets/textformfield_setup_profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_cinema_app/provider/user.dart';
import '../../app/app_routes.dart';
import '../../network/api_request.dart';
import '../../network/apibase/api_response.dart';

class ProfileSetup extends StatelessWidget {
  ProfileSetup({Key? key}) : super(key: key);
  final ImagePicker _picker = ImagePicker();
  File? image;
  TextEditingController numberPhone = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController country = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer2<User, LanguageProvider>(
        builder: (context, userData, languageProvider, child) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: AppTheme.blackGradient,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Image(
                          image: AssetImage(AppImages.buttonBack),
                          width: 30,
                          height: 30,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        S.of(context).profile,
                        // textAlign: TextAlign.center,
                        style: AppFonts.poppins700(20, AppTheme.white)
                            .copyWith(height: 30 / 20),
                      ),
                      const Image(
                        image: AssetImage(AppImages.buttonLocation),
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(children: [
                  SizedBox(child: userData.avatar),
                  Positioned(
                    bottom: 0,
                    right: 23,
                    child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 100,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff000000)
                                            .withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          left: 30,
                                          right: 30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              final XFile? photo =
                                                  await _picker.pickImage(
                                                      source:
                                                          ImageSource.camera);
                                              if (photo != null) {
                                                image = File(photo.path);
                                                userData.updateImage(image);
                                              }
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.camera_alt,
                                                  size: 25,
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  S.of(context).take,
                                                  style: AppFonts.poppins500(
                                                      15,
                                                      Colors.black
                                                          .withOpacity(0.5)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              final XFile? photo =
                                                  await _picker.pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                              if (photo != null) {
                                                image = File(photo.path);
                                                userData.updateImage(image);
                                              }
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.photo_library_rounded,
                                                  size: 25,
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  S.of(context).gallery,
                                                  style: AppFonts.poppins500(
                                                      15,
                                                      Colors.black
                                                          .withOpacity(0.5)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              });
                        },
                        child: const Image(
                          image: AssetImage(AppImages.iconEdit),
                          width: 35,
                          height: 35,
                          fit: BoxFit.fill,
                        )),
                  ),
                ]),
                const SizedBox(
                  height: 27,
                ),
                TextFormmFieldToSetupProfile(
                  title: S.of(context).fullName,
                  textController: fullName,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormmFieldToSetupProfile(
                  title: S.of(context).userName,
                  textController: userName,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormmFieldToSetupProfile(
                  title: S.of(context).email,
                  textController: email,
                  isGmail: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormmFieldToSetupProfile(
                  title: S.of(context).country,
                  textController: country,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormmFieldToSetupProfile(
                  title: S.of(context).hintPhone,
                  textController: numberPhone,
                  isNumberPhone: true,
                ),
                const SizedBox(
                  height: 36,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 28),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.homePage);
                        },
                        child: AppButton(
                          titleButton: S.of(context).skip,
                          flex: 0.3,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                          onTap: () async {
                            if (fullName.text.trim() == "" ||
                                userName.text.trim() == "" ||
                                email.text.trim() == "" ||
                                country.text.trim() == "" ||
                                numberPhone.text.trim() == "" ||
                                numberPhone.text.trim() ==
                                    '+${userData.nationalCode} ') {
                              showMyDialog(context,
                                  title: S.of(context).incompletion,
                                  content: S.of(context).please,
                                  noButton: true);
                            } else {
                              ApiResponse res = await ApiRequest.updateUser(
                                  userData.id,
                                  fullName.text,
                                  userName.text,
                                  numberPhone.text.substring(4),
                                  "${email.text}@gmail.com");
                              if (res.result == true) {
                                showMyDialog(context,
                                    title: S.of(context).congrat,
                                    content: S.of(context).accountReady,
                                    noButton: true);
                                // Đợi 5 giây trước khi chuyển màn
                                Future.delayed(const Duration(seconds: 5), () {
                                  Navigator.pushReplacementNamed(
                                      context, AppRoutes.homePage);
                                });
                              }
                            }
                          },
                          child: AppButton(
                            titleButton: S.of(context).Continue,
                            flex: 0.5,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 62,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
