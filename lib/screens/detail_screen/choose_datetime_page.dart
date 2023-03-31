import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/provider/seat_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/item_date.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class ChooseDateTimePage extends StatefulWidget {
  const ChooseDateTimePage({Key? key}) : super(key: key);

  @override
  State<ChooseDateTimePage> createState() => _ChooseDateTimePageState();
}

class _ChooseDateTimePageState extends State<ChooseDateTimePage> {
  int dateSelectedIndex = -1;
  int timeSelectedIndex = -1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MovieProvider>(context, listen: false)
          .getFilmById();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final seat = Provider.of<SeatProvider>(context);
    List<String> timePicker = ['10:30', '12:30', '2:30', '5:00', '6:45', '8:00', '10:30'];
    List<String> ampm = ['AM', 'PM', 'PM', 'PM', 'PM', 'PM', 'PM'];
    List<String> date = [
      S.of(context).mon,
      S.of(context).tue,
      S.of(context).wed,
      S.of(context).thu,
      S.of(context).fri,
      S.of(context).sat,
      S.of(context).sun
    ];
    List<DateTime> day = List.generate(
      7,
      (index) => DateTime.now().add(Duration(days: index)),
    );
    return Consumer<MovieProvider>(builder: (context, movie, child) {
      if (movie.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (movie.detailFilm.toString().isNotEmpty) {
        return Scaffold(
            body: Stack(clipBehavior: Clip.none, children: [
          Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xFF130B2B), Colors.transparent]),
                image: DecorationImage(
                    image: NetworkImage(movie.detailFilm!.thumbnail.toString()),
                    fit: BoxFit.cover)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width, // W: 390px
                height: 500, // H: 654px
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter, // X constraint: Left
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFF130B2B),
                      Colors.transparent,
                    ],
                  ),
                ), // Y: 190px
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xFF130B2B),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(flex: 2,),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Text(
                        movie.detailFilm!.title.toString(),
                        textAlign: TextAlign.center,
                        style: AppFonts.poppins700(20, Colors.white),
                      ),
                      Text(
                        movie.detailFilm!.language.toString() + movie.time,
                        style: AppFonts.poppins600(14, Colors.white),
                      ),
                      ReadMoreText(
                        movie.detailFilm!.description.toString(),
                        trimLines: 3,
                        trimMode: TrimMode.Line,
                        colorClickableText: Colors.white,
                        trimCollapsedText: 'Read more',
                        trimExpandedText: '...Show less',
                        style: AppFonts.poppins500(16, Colors.white),
                        textAlign: TextAlign.center,
                        moreStyle: AppFonts.poppins700(16, Colors.white),
                        lessStyle: AppFonts.poppins700(16, Colors.white),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Text(
                        'Selected date and time',
                        style: AppFonts.poppins700(17, null),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          height: 80,
                          child: ListView.builder(
                              itemCount: date.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      dateSelectedIndex = index;
                                    });
                                  },
                                  child: ItemDate(
                                    day: date[index],
                                    date: day[index].toIso8601String().substring(8, 10),
                                    padding: const EdgeInsets.all(15),
                                    isSelected: dateSelectedIndex == index ? true : false,
                                  ),
                                );
                              }),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          height: 60,
                          child: ListView.builder(
                              itemCount: timePicker.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      timeSelectedIndex = index;
                                    });
                                  },
                                  child: ItemDate(
                                    day: timePicker[index],
                                    date: ampm[index],
                                    padding: const EdgeInsets.fromLTRB(13, 8, 13, 4),
                                    isSelected: timeSelectedIndex == index ? true : false,
                                  ),
                                );
                              }),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppButton(
                          onTap: () {
                            seat.getId(movie.id);
                            Navigator.pushNamed(context, AppRoutes.seatScreen);
                          },
                          titleButton: 'Select Seats'),
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
      }
      return const Text('NO DATA');
    });
  }
}
