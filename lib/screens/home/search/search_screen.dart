import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_background_theme.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/provider/search_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/widgets/app_search.dart';
import 'package:flutter_cinema_app/widgets/item_topsearch.dart';
import 'package:flutter_cinema_app/widgets/key_board_dismiss.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SearchProvider>(context, listen: false).getAllMovies();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismiss(
      child: Container(
        decoration: AppBackGroundTheme.searchTheme,
        child: Consumer<SearchProvider>(builder: (context, search, child) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 150,
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Column(
                children: [
                  Text(
                    S.of(context).search,
                    style: AppFonts.poppins700(15, AppTheme.white.withOpacity(0.87)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AppSearch(
                    onFieldSubmitted: (value) {
                      search.searchMovies(value);
                    },
                  ),
                ],
              ),
            ),
            body: Consumer<SearchProvider>(
              builder: (context, search, child) {
                if (search.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return search.foundMovie.isNotEmpty
                    ? ListView(
                        shrinkWrap: true,
                        children: search.foundMovie
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
                                    child: ItemTopsearch(
                                        movie: e.thumbnailMobile ?? "",
                                        name: e.title ?? "",
                                        time: e.startTime ?? "",
                                        category: e.category ?? ""),
                                  ),
                                ))
                            .toList(),
                      )
                    : const Center(
                        child: Text(
                          "Not results found",
                          style: TextStyle(color: AppTheme.white),
                        ),
                      );
              },
            ),
          );
        }),
      ),
    );
  }
}
