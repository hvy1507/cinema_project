import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/widgets/add_card_widget.dart';
import 'package:flutter_cinema_app/widgets/back_button.dart';
import 'package:provider/provider.dart';

import '../../app/app_theme.dart';
import '../../generated/l10n.dart';
import '../../provider/provider.dart';
import '../../provider/user.dart';
import '../../resource/fonts/app_fonts.dart';
import '../../resource/images/app_images.dart';
import '../../widgets/app_button.dart';

class AddNewCard extends StatelessWidget {
   AddNewCard({Key? key}) : super(key: key);
  TextEditingController cardNumber = TextEditingController();
   TextEditingController nameOnCard = TextEditingController();
   TextEditingController expiryDate = TextEditingController();
   TextEditingController securityCode = TextEditingController();
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
                        Text(S.of(context).payment, style: AppFonts.poppins400(12, AppTheme.white)
                            .copyWith(height: 18 / 12),),
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Container(
                              width: 47,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xff000000).withOpacity(0.25),
                                      offset: const Offset(5, 8),
                                      blurRadius: 30.0,
                                      spreadRadius: 0
                                    )
                                  ],
                                ),
                                alignment: Alignment.center,
                                child: const Image(image:AssetImage(AppImages.iconVISA),width: 31.84,height: 12.75,fit: BoxFit.fill )),
                            const SizedBox(width: 32,),
                            const Image(image:AssetImage(AppImages.iconPayPal),width: 47,height: 34, fit: BoxFit.fill),
                            const SizedBox(width: 32,),
                            Container(
                                width: 47,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0xff000000).withOpacity(0.25),
                                        offset: const Offset(5, 8),
                                        blurRadius: 30.0,
                                        spreadRadius: 0
                                    )
                                  ],
                                ),
                                alignment: Alignment.center,
                                child: const Image(image:AssetImage(AppImages.imageApplePay),width: 35.81,height: 15.63,fit: BoxFit.fill, )),
                          ],
                        ),
                        const SizedBox(height: 43,),
                        Stack(
                          clipBehavior: Clip.none,
                          children:[
                            const Image(image: AssetImage(AppImages.DropShadow),width: 328,height: 200,fit: BoxFit.fill,),
                            Positioned(
                              top: -16,
                              child: Container(
                              width: 328,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: const LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      Color(0xffCD1261),
                                      Color(0xff885DF5)
                                    ]
                                ),
                                image: const DecorationImage(
                                  image: AssetImage(AppImages.Noise),
                                  fit: BoxFit.fill
                                ),
                              ),
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: const [
                                      Image(image: AssetImage(AppImages.iconChip),width: 38,height: 26,fit: BoxFit.fill,),
                                      Image(image: AssetImage(AppImages.Mastercard),width: 40,height: 40,fit: BoxFit.fill,)
                                    ],
                                  ),
                                  const SizedBox(height:23,),
                                   Text(userData.numberOnCard, style: AppFonts.ocrA400(24, AppTheme.white)
                                       .copyWith(height: 26 / 24),),
                                  const SizedBox(height:22,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(S.of(context).cardholder,style: AppFonts.ibmPS500(10, AppTheme.white).copyWith(height: 13 / 10) ,),
                                            const SizedBox(height:2,),
                                            Text(userData.nameOfUserOnCard,style: AppFonts.ibmPS700(18, AppTheme.white).copyWith(height: 23 / 18) ,),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(S.of(context).expiry,style: AppFonts.ibmPS500(10, AppTheme.white).copyWith(height: 13 / 10) ,),
                                            const SizedBox(height:2,),
                                            Text(userData.expiryDateOnCard,style: AppFonts.ocrA400(18, AppTheme.white).copyWith(height: 23/ 18) ,),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                          ),
                            ),]
                        ),
                        const SizedBox(height: 7,),
                        Padding(padding: const EdgeInsets.only(left: 38,right: 38,top: 7,bottom: 36),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.of(context).cardNumber,style: AppFonts.poppins600(15, AppTheme.white).copyWith(height: 24 / 15) ,),
                            const SizedBox(height: 1,),
                            AddCard(title: '* * * *  * * * *  1 2 3 4', textController: cardNumber, flex: 0.8,isNumber: true,),
                            const SizedBox(height: 35,),
                            Text(S.of(context).nameOnCard,style: AppFonts.poppins600(15, AppTheme.white).copyWith(height: 24 / 15) ,),
                            const SizedBox(height: 1,),
                            AddCard(title: S.of(context).userName, textController:nameOnCard, flex: 0.8,isName: true,),
                            const SizedBox(height: 45,),
                            Row(children: [
                              Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(S.of(context).expiry,style: AppFonts.poppins600(15, AppTheme.white).copyWith(height: 24 / 15) ,),
                                  const SizedBox(height: 3,),
                                  AddCard(title: 'dd/mm', textController: expiryDate, flex: 0.8,isDate: true,)
                                ],
                              )),
                              const SizedBox(width: 36,),
                              Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(S.of(context).securityCode,style: AppFonts.poppins600(15, AppTheme.white).copyWith(height: 24 / 15) ,),
                                  const SizedBox(height: 3,),
                                  AddCard(title: '* * *', textController: securityCode, flex: 0.8)
                                ],
                              ))
                            ],),
                          ],
                        ),),
                        Text(S.of(context).ReviewDetails, style: AppFonts.poppins700(16, AppTheme.white)
                            .copyWith(height: 24 / 16),),
                        const SizedBox(height: 18,),
                        Padding(padding: const EdgeInsets.only(left: 23,right: 22),
                            child: InkWell(
                              onTap: (){
                                if(
                                cardNumber.text.trim() != "" &&
                                    nameOnCard.text.trim() != "" &&
                                    expiryDate.text.trim() != "" &&
                                    securityCode.text.trim() != ""
                                ){
                                Navigator.pop(context,cardNumber.text);}
                              },
                                child: AppButton(titleButton: S.of(context).add))),
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