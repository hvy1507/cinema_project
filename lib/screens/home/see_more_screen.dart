import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_background_theme.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/model/model_moives.dart';
import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/provider/search_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/widgets/app_search.dart';
import 'package:flutter_cinema_app/widgets/back_button.dart';
import 'package:flutter_cinema_app/widgets/item_movie.dart';
import 'package:flutter_cinema_app/widgets/key_board_dismiss.dart';
import 'package:provider/provider.dart';

class SeeMoreScreen extends StatefulWidget {
  const SeeMoreScreen({super.key});

  @override
  State<SeeMoreScreen> createState() => _SeeMoreScreenState();
}

class _SeeMoreScreenState extends State<SeeMoreScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    String title = arguments["title"] as String;
    List<Items> listMoiveFromHome = arguments["listMovie"] as List<Items>;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SearchProvider>(context, listen: false)
          .listMoviesTitleData(listMoiveFromHome);
    });

    return KeyboardDismiss(
      child: Consumer<SearchProvider>(builder: (context, search, child) {
        return Container(
          decoration: AppBackGroundTheme.searchTheme,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 150,
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(children: [
                    const Expanded(child: AppBackButton()),
                    Expanded(
                      flex: 8,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: AppFonts.poppins700(15, AppTheme.white.withOpacity(0.87)),
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox.shrink())
                  ]),
                  const SizedBox(
                    height: 30,
                  ),
                  AppSearch(
                    onFieldSubmitted: (value) {
                      search.searchMovieTitle(value);
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            body: search.foundMovieTitle.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 27),
                    child: ListView(
                      shrinkWrap: true,
                      children: search.foundMovieTitle
                          .map((e) => Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: InkWell(
                                  onTap: () {
                                    Provider.of<MovieProvider>(context, listen: false)
                                        .getId(e.id.toString());
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.chooseDateTimePage,
                                    );
                                  },
                                  child: ItemMovie(
                                    movie: e.thumbnailMobile ?? "",
                                    name: e.title ?? "",
                                    startTime: e.startTime ?? "",
                                    endTime: e.endTime ?? "",
                                    language: e.language ?? "",
                                    category: e.category ?? "",
                                    numberRating: Random().nextInt(5).toDouble(),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  )
                : const Center(
                    child: Text(
                      "Not results found",
                      style: TextStyle(color: AppTheme.white),
                    ),
                  ),
          ),
        );
      }),
    );
  }
}
