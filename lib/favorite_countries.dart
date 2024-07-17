import 'package:flutter/material.dart';
import 'package:world_country/components/list.dart';
import 'package:world_country/country.dart';

class FavoriteCountries extends StatefulWidget {
  List<Country> _allCountry = [];
  List<String> _favoriteCounties = [];

  FavoriteCountries(this._allCountry, this._favoriteCounties);

  @override
  State<FavoriteCountries> createState() => _FavoriteCountriesState();
}

class _FavoriteCountriesState extends State<FavoriteCountries> {
  List<Country> _allFavoriteCountries = [];

  @override
  void initState() {
    super.initState();

    for (Country country in widget._allCountry) {
      if (widget._favoriteCounties.contains(country.countryCode)) {
        _allFavoriteCountries.add(country);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Favorite Countries"),
    );
  }

  Widget _buildBody() {
    return OrtakComponent(_allFavoriteCountries, widget._favoriteCounties);
  }
}
