import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:intl/intl.dart';

class ItemMovie extends StatelessWidget {
  const ItemMovie(
      {super.key,
      required this.movie,
      required this.name,
      required this.startTime,
      required this.endTime,
      required this.category,
      required this.numberRating,
      this.onTap,
      required this.language});

  final String movie;
  final String name;
  final double numberRating;
  final String startTime;
  final String endTime;

  final String language;
  final String category;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ');
    DateTime startTime1 = formatter.parse(startTime);
    DateTime endTime1 = formatter.parse(endTime);
    Duration duration = endTime1.difference(startTime1);
    String time = printDuration(duration, abbreviated: true);

    return Container(
      margin: const EdgeInsets.only(bottom: 26),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: NetworkImage(movie),
                  height: 167,
                  width: 122,
                  fit: BoxFit.cover,
                ),
                // child: Image.asset(
                //   movie,
                //   height: 167,
                //   fit: BoxFit.fitHeight,
                // )),
              )),
          const SizedBox(
            width: 25,
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 167,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      name.toUpperCase(),
                      overflow: TextOverflow.visible,
                      style: AppFonts.poppins600(13, AppTheme.white),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 10,
                      child: Row(
                        children: [
                          for (var i = 0; i < 5; i++)
                            if (i < numberRating)
                              Container(
                                margin: const EdgeInsets.only(right: 3),
                                child: const Icon(
                                  Icons.star,
                                  size: 11,
                                  color: AppTheme.yellow,
                                ),
                              )
                            else
                              Container(
                                margin: const EdgeInsets.only(right: 3),
                                child: const Icon(
                                  Icons.star,
                                  size: 11,
                                  color: Color(0xffE0DFE4),
                                ),
                              )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Text(
                      time,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          height: 15 / 10,
                          letterSpacing: 0.5,
                          color: AppTheme.white),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      language,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          height: 15 / 10,
                          letterSpacing: 0.5,
                          color: AppTheme.white),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      category,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          height: 15 / 10,
                          letterSpacing: 0.5,
                          color: AppTheme.white),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: onTap,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: AppTheme.pinkGradient),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: AppTheme.purpleGradient),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 2, bottom: 1, left: 12, right: 9),
                              child: Text("Buy tickets",
                                  textAlign: TextAlign.center,
                                  style: AppFonts.roboto500(
                                      12, AppTheme.white.withOpacity(0.9))),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
