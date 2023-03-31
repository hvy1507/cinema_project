import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/user.dart';
import 'ensign.dart';
class TextFormmFieldToSetupProfile extends StatefulWidget {
  const TextFormmFieldToSetupProfile ({super.key, required this.title,required this.textController,this.isNumberPhone,this.isGmail});
  final String title;
  final TextEditingController textController ;
  final bool? isNumberPhone  ;
  final bool? isGmail ;
  @override
  State<TextFormmFieldToSetupProfile> createState() => _TextFormmFieldToSetupProfileState();
}
class _TextFormmFieldToSetupProfileState extends State<TextFormmFieldToSetupProfile> {
  Color color = AppTheme.green;
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context,userData,child){
      return Stack(
          children:[ Container(
            width: 340,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xffFFFFFF).withOpacity(0.06),
            ),
            child:
            TextFormField(
              keyboardType:widget.isGmail==true?TextInputType.emailAddress: widget.isNumberPhone == true?TextInputType.number: TextInputType.text,
              textAlign: widget.isNumberPhone == true? TextAlign.center : TextAlign.left,
              decoration:  InputDecoration(
                contentPadding: const EdgeInsets.symmetric( horizontal: 20,vertical: 17),
                hintText: '${widget.title}*',hintStyle: const TextStyle(
                color: Color(0xffFFFFFF),),
                suffixText: widget.isGmail==true?'@gmail.com':'',
                suffixStyle:  AppFonts.poppins500(18,AppTheme.white),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: color,width: 2),
                    borderRadius: BorderRadius.circular(30)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppTheme.pink,width: 2),
                    borderRadius: BorderRadius.circular(30)
                ),
              ),
              onChanged: (value) {
                setState(() {
                  value.trim() != ''? color = AppTheme.pink:color = AppTheme.green;
                });
              },
              style: AppFonts.poppins500(18,AppTheme.white),
              cursorColor: const Color(0xffFFFFFF),
              controller: widget.textController,
              onTap: () {
                if(widget.isNumberPhone == true){
                  widget.textController.value = TextEditingValue(
                      text: '+${userData.nationalCode} ',
                      selection: TextSelection.fromPosition(
                          const TextPosition(offset: 4)));}
              },
            ),

          ),
            Positioned(top: 7,left: 24,
              child :widget.isNumberPhone == true? SizedBox(
                width: 60,
                child: DropdownButton<Image>(
                  isExpanded: true,
                  value: userData.ensign,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 20,
                    color: Color(0xffFFFFFF),
                  ),
                  elevation: 16,
                  underline: Container(
                    color: Colors.transparent,
                  ),
                  onChanged: (value) {
                    // This is called when the user selects an item.
                    userData.selectedEnsign(value!);
                  },
                  items: [
                    DropdownMenuItem(
                      value: EnsignItem.vietnam,
                      child: EnsignItem.vietnam,
                    ),
                    DropdownMenuItem(
                      value: EnsignItem.US,
                      child: EnsignItem.US,
                    ),
                    DropdownMenuItem(
                      value: EnsignItem.india,
                      child: EnsignItem.india,
                    ),
                    DropdownMenuItem(
                      value: EnsignItem.Italy,
                      child: EnsignItem.Italy,
                    )
                  ],
                ),
              ):const SizedBox.shrink(),)
          ]
      );});
  }}

