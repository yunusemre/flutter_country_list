import 'package:flutter/material.dart';
import 'package:world_country/home-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Country',
      home: HomePage(),
    );
  }
}

/*
*
* [
  {
    "flags": {
      "png": "https://flagcdn.com/w320/tr.png",
      "svg": "https://flagcdn.com/tr.svg",
      "alt": "The flag of Turkey has a red field bearing a large fly-side facing white crescent and a smaller five-pointed white star placed just outside the crescent opening. The white crescent and star are offset slightly towards the hoist side of center."
    },
    "name": {
      "common": "Turkey",
      "official": "Republic of Turkey",
      "nativeName": {
        "tur": {
          "official": "Türkiye Cumhuriyeti",
          "common": "Türkiye"
        }
      }
    },
    "cca2": "TR",
    "capital": [
      "Ankara"
    ],
    "region": "Asia",
    "languages": {
      "tur": "Turkish"
    },
    "population": 84339067
  }
]
* */
