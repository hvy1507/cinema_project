import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';

class VoucherDeals extends StatelessWidget {
  const VoucherDeals(
      {super.key,
      required this.image,
      required this.title,
      required this.type,
      required this.percent,
      this.onTap});

  final String image;
  final String title;
  final String type;
  final int percent;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: AppTheme.voucherGradient,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 20,
                  spreadRadius: 3,
                  color: const Color(0xff000000).withOpacity(0.2))
            ]),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 19, bottom: 14, right: 12, left: 12),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  )),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          height: 19 / 14,
                          letterSpacing: 0.02,
                          color: AppTheme.white),
                    ),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) =>
                          AppTheme.yellowGradient.createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                      child: Row(
                        children: [
                          Text(
                            type,
                            style: const TextStyle(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 9,
                              height: 12 / 9,
                              letterSpacing: 0.02,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "$percent%",
                            style: const TextStyle(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              height: 33 / 24,
                              letterSpacing: 0.02,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: AppTheme.yellowGradient),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 20),
                        child: Text(
                          " Click Here",
                          textAlign: TextAlign.center,
                          style: AppFonts.openSans600(10,const Color(0xff4D438A)),
                        ),
                      ),
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
