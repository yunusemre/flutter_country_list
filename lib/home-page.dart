import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:world_country/components/list.dart';
import 'package:world_country/country.dart';
import 'package:world_country/favorite_countries.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _apiURL =
      'https://restcountries.com/v3.1/all?fields=name,population,flags,capital,region,languages,cca2';
  List<Country> allCountry = [];
  List<String> _favoriteCounties = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCountry();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Home Page'),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              _gotoFavoriteCountiesPage(context);
            },
            icon: Icon(Icons.favorite, color: Colors.red))
      ],
    );
  }

  Widget buildBody() {
    return allCountry.isNotEmpty
        ? OrtakComponent(allCountry, _favoriteCounties)
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  void getCountry() async {
    Uri uri = Uri.parse(_apiURL);
    http.Response response = await http.get(uri);
    List<dynamic> parsedJson = jsonDecode(response.body);

    for (int i = 0; i < parsedJson.length; i++) {
      Map<String, dynamic> cntry = parsedJson[i];
      Country country = Country.fromMap(cntry);
      allCountry.add(country);
    }

    setState(() {});
  }

  void _gotoFavoriteCountiesPage(BuildContext context) {
    MaterialPageRoute path = MaterialPageRoute(builder: (context) {
      return FavoriteCountries(allCountry, _favoriteCounties);
    });
    Navigator.push(context, path);
  }
}
