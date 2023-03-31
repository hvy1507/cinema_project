import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';

class DetailFilmPage extends StatefulWidget {
  const DetailFilmPage({Key? key}) : super(key: key);

  @override
  State<DetailFilmPage> createState() => _DetailFilmPageState();
}

class _DetailFilmPageState extends State<DetailFilmPage> {
  @override
  Widget build(BuildContext context) {
    String names = 'Marin, Bengi, Faker, Bang, Wofl';
    List<String> listName = names.split(',');
    int star = 4;
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.bannerAvenger), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Doctor Strange \n in the Multiverse of Madness',
              style: AppFonts.roboto700(22, Colors.white).copyWith(height: 33 / 22),
              textAlign: TextAlign.center,
            ),
            Text(
              '2h 6m | Action , Adventure ,Fantasy | UA',
              style: AppFonts.poppins400(13, Colors.white).copyWith(height: 20 / 13),
            ),
            SizedBox(
              height: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    if (i < star)
                      const Icon(Icons.star, color: Colors.yellow, size: 17)
                    else
                      const Icon(
                        Icons.star,
                        color: Color(0xffE0DFE4),
                        size: 17,
                      )
                ],
              ),
            ),
            Text(
              'Dr. Stephen Strange casts a forbidden spell that opens the doorway to the multiverse, including alternate versions of himself, whose threat to humanity is too great for the combined forces of Strange, Wong, and Wanda Maximoff.',
              style: AppFonts.poppins500(16, Colors.white).copyWith(height: 24 / 16),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 34),
              decoration: BoxDecoration(
                gradient: AppTheme.blackGradient,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cast',
                    style: AppFonts.poppins500(19, Colors.white.withOpacity(0.8)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: SizedBox(
                      height: 150,
                      child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.only(right: 18),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.greenAccent),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                              AppImages.iconProfile,
                                            ),
                                            fit: BoxFit.fill)),
                                  ),
                                  Flexible(
                                      child: Text(
                                    listName[index],
                                    style: TextStyle(color: Colors.white),
                                  ))
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(height: 45),
                  AppButton(titleButton: 'Book tickets')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
