import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/widgets/item_instrest.dart';

import '../../generated/l10n.dart';

class ChooseLocation extends StatelessWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: AppTheme.blackBackground,
          image: DecorationImage(
              image: AssetImage(AppImages.layer1), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 57,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Text(
                  S.of(context).chooseyourLocations,
                  // textAlign: TextAlign.center,
                  style: AppFonts.poppins500(
                          MediaQuery.of(context).size.width * (22 / 390),
                          AppTheme.white)
                      .copyWith(height: 33 / 22),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 31, right: 31, top: 32, bottom: 29),
                child: Text(
                  S.of(context).chooseYouLocation,
                  // textAlign: TextAlign.center,
                  style: AppFonts.poppins500(16, AppTheme.white)
                      .copyWith(height: 25 / 16),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).chooseLocation,
                        // textAlign: TextAlign.center,
                        style: AppFonts.poppins500(18, AppTheme.white)
                            .copyWith(height: 27 / 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          ItemInstrest(title: 'Hà Nội'),
                          const SizedBox(
                            width: 15,
                          ),
                          ItemInstrest(title: 'Hồ Chí Minh'),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          ItemInstrest(title: 'Bình Dương'),
                          const SizedBox(
                            width: 15,
                          ),
                          ItemInstrest(title: 'Thái Bình'),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          ItemInstrest(title: 'Thanh Hóa'),
                          const SizedBox(
                            width: 15,
                          ),
                          ItemInstrest(title: 'Nghệ An'),
                        ],
                      ),
                      const SizedBox(
                        height: 41,
                      ),
                      Text(
                        S.of(context).chooseLanguage,
                        // textAlign: TextAlign.center,
                        style: AppFonts.poppins500(18, AppTheme.white)
                            .copyWith(height: 27 / 18),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Row(
                        children: [
                          ItemInstrest(
                            title: S.of(context).eng,
                            isButtonEng: true,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ItemInstrest(
                            title: S.of(context).vie,
                            isButtonVie: true,
                          ),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 68,
              ),
              Container(
                padding: const EdgeInsets.only(left: 28),
                child: Row(
                  children: [
                    // SizedBox(width: 135,
                    //     child: AppButton(titleButton: 'Skip')),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.profileSetup);
                        },
                        child: AppButton(
                          titleButton: S.of(context).skip,
                          flex: 0.3,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    // SizedBox(width: 178,
                    //     child: AppButton(titleButton: 'Continue'))
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.profileSetup);
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
  }
}
