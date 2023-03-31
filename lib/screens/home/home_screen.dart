import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_background_theme.dart';
import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/provider/search_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/widgets/list_movie_widget.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MovieProvider>(context, listen: false)
          .getMoviesByType("Coming");
      Provider.of<MovieProvider>(context, listen: false)
          .getMoviesByType("Finish");
      Provider.of<MovieProvider>(context, listen: false)
          .getMoviesByType("Romance");
      Provider.of<MovieProvider>(context, listen: false)
          .getMoviesByType("Adventure");
      Provider.of<MovieProvider>(context, listen: false)
          .getMoviesByType("Comedy");
      Provider.of<MovieProvider>(context, listen: false)
          .getMoviesByType("Documentary");
      Provider.of<MovieProvider>(context, listen: false)
          .getMoviesByType("Action");
      Provider.of<MovieProvider>(context, listen: false)
          .getMoviesByType("Science fiction");
      Provider.of<MovieProvider>(context, listen: false).getMoviesByType("War");
      Provider.of<MovieProvider>(context, listen: false).getBanner();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBackGroundTheme.searchTheme,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Consumer2<MovieProvider, SearchProvider>(
            builder: (context, movie, search, child) {
              return Container(
                margin: const EdgeInsets.only(left: 12),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 30,
                            height: 30,
                          ),
                          Text(
                            "PVR Cinemas",
                            style:
                                AppFonts.poppins700(16, const Color(0xffffffff))
                                    .copyWith(height: 22 / 16),
                          ),
                          const Image(
                            image: AssetImage(AppImages.buttonLocation),
                            width: 30,
                            height: 30,
                            fit: BoxFit.fill,
                          )
                        ],
                      ),
                    ),
                    ListMovieWidget(
                        title: " ", listMovie: movie.listNews, isBanner: true),
                    const SizedBox(
                      height: 17,
                    ),
                    ListMovieWidget(
                        title: S.of(context).comingSoon,
                        listMovie: movie.listMoviesComing),
                    const SizedBox(
                      height: 17,
                    ),
                    ListMovieWidget(
                        title: S.of(context).nowShowing,
                        listMovie: movie.listMoviesFinish),
                    const SizedBox(
                      height: 17,
                    ),
                    ListMovieWidget(
                        title: S.of(context).romance,
                        listMovie: movie.listMoviesRomance),
                    const SizedBox(
                      height: 17,
                    ),
                    ListMovieWidget(
                        title: S.of(context).adventure,
                        listMovie: movie.listMoviesAdventure),
                    const SizedBox(
                      height: 17,
                    ),
                    ListMovieWidget(
                        title: S.of(context).comedy,
                        listMovie: movie.listMoviesComedy),
                    const SizedBox(
                      height: 17,
                    ),
                    ListMovieWidget(
                        title: S.of(context).documentary,
                        listMovie: movie.listMoviesDocumentary),
                    const SizedBox(
                      height: 17,
                    ),
                    ListMovieWidget(
                        title: S.of(context).action,
                        listMovie: movie.listMoviesAction),
                    const SizedBox(
                      height: 17,
                    ),
                    ListMovieWidget(
                        title: S.of(context).science,
                        listMovie: movie.listMoviesScienceFiction),
                    const SizedBox(
                      height: 17,
                    ),
                    ListMovieWidget(
                        title: S.of(context).war,
                        listMovie: movie.listMoviesWar),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
