import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:world_country/country.dart';
import 'package:world_country/country_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _apiURL =
      'https://restcountries.com/v3.1/all?fields=name,population,flags,capital,region,languages,cca2';
  List<Country> allCountry = [];

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
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('Home Page'),
      centerTitle: true,
    );
  }

  Widget buildBody() {
    return allCountry.isNotEmpty
        ? ListView.builder(
            itemBuilder: _buildListItem, itemCount: allCountry.length)
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget _buildListItem(BuildContext context, int index) {
    Country country = allCountry[index];
    return Card(
        child: ListTile(
      title: Text(country.name + " - " + country.countryCode),
      subtitle: Text("Region: ${country.region}"),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(country.flags),
      ),
      trailing: Icon(
        Icons.favorite_border,
        color: Colors.red,
      ),
      onTap: () {
        gotoDetailPage(context, country);
      },
    ));
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

  void gotoDetailPage(BuildContext context, Country country) async {
    MaterialPageRoute path = MaterialPageRoute(builder: (context) {
      return CountryDetail(country);
    });
    Navigator.push(context, path);
  }
}
