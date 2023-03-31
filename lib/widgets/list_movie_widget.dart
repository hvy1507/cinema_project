import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/model/model_moives.dart';
import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/widgets/widget_banner.dart';
import 'package:flutter_cinema_app/widgets/widget_movie.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';

class ListMovieWidget extends StatefulWidget {
  const ListMovieWidget(
      {super.key,
      required this.title,
      this.onTap,
      required this.listMovie,
      this.isBanner});
  final String title;
  final List<Items> listMovie;

  final Function()? onTap;
  final bool? isBanner;

  @override
  State<ListMovieWidget> createState() => _ListMovieWidgetState();
}

class _ListMovieWidgetState extends State<ListMovieWidget> {
  final PageController _pageController = PageController(viewportFraction: 1.0);
  int _currentIndex = 0;
  void _changePage(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentIndex < 10) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _changePage(_currentIndex);
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: AppFonts.openSans700(16, AppTheme.white),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.seeMoreScreen, arguments: {
                "title": widget.title,
                "listMovie": widget.listMovie,
              });
            },
            child: widget.isBanner == true
                ? const SizedBox.shrink()
                : Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: Text(S.of(context).see,
                        style: AppFonts.poppins400(10, AppTheme.white))),
          )
        ],
      ),
      const SizedBox(
        height: 13,
      ),
      FutureBuilder(builder: (context, snapshot) {
        if (widget.listMovie.isNotEmpty) {
          return SizedBox(
            height: 220,
            child: widget.isBanner == true
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 200,
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: _onPageChanged,
                          scrollDirection: Axis.horizontal,
                          children: widget.listMovie
                              .map((e) => WidgetBanner(items: e))
                              .toList(),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 11; i++)
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentIndex == i
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.5),
                                ),
                                margin: const EdgeInsets.only(right: 8),
                              ),
                          ],
                        ),
                      )
                    ],
                  )
                : ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: widget.listMovie
                        .map((e) => GestureDetector(
                            onTap: () {
                              Provider.of<MovieProvider>(context, listen: false)
                                  .getId(e.id.toString());
                              Navigator.pushNamed(context, AppRoutes.chooseDateTimePage,
                                  );
                            },
                            child: WidgetMovie(items: e)))
                        .toList(),
                  ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    ]);
  }
}
