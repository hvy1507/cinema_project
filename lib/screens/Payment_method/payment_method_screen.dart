import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/app_pay.dart';
import 'package:flutter_cinema_app/widgets/back_button.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';

import '../../app/app_theme.dart';
import '../../generated/l10n.dart';
import '../../provider/provider.dart';
import '../../provider/user.dart';
import '../../resource/fonts/app_fonts.dart';
import '../../resource/images/app_images.dart';
List<AppPay> Card = <AppPay>[];
class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<User, LanguageProvider>(
        builder: (context, userData, languageProvider, child) {
          return
        Scaffold(
          body: SingleChildScrollView(
            child: Container(
            width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
      gradient: AppTheme.backgroundColor,
      ),
      child:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 46,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right:20 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:   [
                const AppBackButton(),
                Text("PVR Cinemas",textAlign: TextAlign.center,
                style: AppFonts.poppins700(20, AppTheme.white)
                    .copyWith(height: 30 / 20),),
                const Image(image: AssetImage(AppImages.calendrierButton),width: 40,height: 40,fit: BoxFit.fill,)
              ],
            ),
          ),
          const SizedBox(height: 45,),
          Padding(padding: const EdgeInsets.only(left:41 ,right: 26),
          child: Text(S.of(context).Payment, style: AppFonts.poppins500(18, AppTheme.white)
              .copyWith(height: 27 / 18),),),
          Padding(padding: const EdgeInsets.only(left: 25,right: 25),
          child: Column(
            children:  [const SizedBox(height: 43,),
              const AppPay(logo:AppImages.paypal_logo, namePay: 'PayPal'),
              const AppPay(logo: AppImages.iconGoogle, namePay: 'Google Pay'),
              const AppPay(logo: AppImages.iconApple, namePay: 'Apple Pay'),
              for(int i=0;i<Card.length;i++)Card[i],
              const SizedBox(height: 43,),],
          ),),
              InkWell(
                onTap: () async {
                  String data = await Navigator.pushNamed(context, AppRoutes.addNewCard) as String;
                  if(data!= null) {
                    Card.add(AppPay(logo: AppImages.Mastercard, namePay: data));
                    setState(() {
                      userData.resetNameOfUserOnCard();
                      userData.resetNumberOnCard();
                      userData.resetExpiryDateOnCard();
                    });
                  };
                },
                child: Container(
                  width: 340,
                  height: 47,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xffffffff).withOpacity(0.06),
                      border: GradientBoxBorder(
                          gradient: LinearGradient(colors: [
                            const Color(0xffFF53C0),
                            const Color(0xffFF53C0).withOpacity(0),
                            const Color(0xffFF53C0).withOpacity(0),
                            const Color(0xffFF53C0),
                          ]),
                          width: 2)),
                  alignment: Alignment.center,
                  child: Text(S.of(context).addNewCard, style: AppFonts.poppins600(16, AppTheme.white).copyWith(height: 24 / 16),),
                ),
              ),
          const SizedBox(height: 100,),
          Text(S.of(context).ReviewDetails, style: AppFonts.poppins700(16, AppTheme.white)
              .copyWith(height: 24 / 16),),
          const SizedBox(height: 18,),
          Padding(padding: const EdgeInsets.only(left: 23,right: 22),
              child: AppButton(titleButton: S.of(context).checkout)),
          const SizedBox(height: 25,),
          Container(
            width: 134,
            height:5 ,
            decoration: BoxDecoration(
              color:const Color(0xffffffff).withOpacity(0.8),
              borderRadius: BorderRadius.circular(100)
            ),
          ),
          const SizedBox(height: 8,),
        ],
      )))
        );});}}