import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/provider/book_ticket.dart';

import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/provider/provider.dart';
import 'package:flutter_cinema_app/provider/search_provider.dart';
import 'package:flutter_cinema_app/provider/seat_provider.dart';
import 'package:flutter_cinema_app/provider/user.dart';
import 'package:flutter_cinema_app/widgets/key_board_dismiss.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => User()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => BookTicket()),
        ChangeNotifierProvider(create: (_) => SeatProvider()),
        ChangeNotifierProvider(create: (_) => MovieProvider()),
      ],
      builder: (context, _) {
        final languageProvider = Provider.of<LanguageProvider>(context);
        return KeyboardDismiss(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splashScreen,
            routes: AppRoutes.routes,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: languageProvider.locale, // Set the current locale
          ),
        );
      },
    );
  }
}
