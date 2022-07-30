import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Science Blog',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // English, no country code
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'dana',
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontFamily: 'dana',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              //color: SolidColors.posterTitle
            ),
            headline2: TextStyle(
                fontFamily: 'dana',
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.white),
            headline3: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              //color: SolidColors.seeMore
            ),
            headline4: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 70, 70, 70)),
            headline5: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              //color: SolidColors.hintText
            ),
            subtitle1: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              //color: SolidColors.posterSubTitle
            ),
            bodyText1: TextStyle(
              fontFamily: 'dana',
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
          )),
      home: Scaffold(
        body: Center(
            child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("data"),
                  Text("data"),
                  Text("data"),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
