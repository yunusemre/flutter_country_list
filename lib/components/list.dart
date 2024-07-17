import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_country/country.dart';
import 'package:world_country/country_detail.dart';

class OrtakComponent extends StatefulWidget {
  List<Country> allCountry = [];
  List<String> favoriteCounties = [];

  OrtakComponent(this.allCountry, this.favoriteCounties);

  @override
  State<OrtakComponent> createState() => _OrtakComponentState();
}

class _OrtakComponentState extends State<OrtakComponent> {
  @override
  Widget build(BuildContext context) {
    return widget.allCountry.isNotEmpty
        ? ListView.builder(
            itemBuilder: _buildListItem, itemCount: widget.allCountry.length)
        : Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("No Data", textAlign: TextAlign.center),
                  ),
                ),
              ),
            ],
          );
  }

  Widget _buildListItem(BuildContext context, int index) {
    Country country = widget.allCountry[index];
    return Card(
        child: ListTile(
      title: Text(country.name + " - " + country.countryCode),
      subtitle: Text("Region: ${country.region}"),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(country.flags),
      ),
      trailing: IconButton(
        icon: widget.favoriteCounties.contains(country.countryCode)
            ? Icon(Icons.favorite, color: Colors.red)
            : Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
        onPressed: () {
          clickFavorite(country);
        },
      ),
      onTap: () {
        gotoDetailPage(context, country);
      },
    ));
  }

  void gotoDetailPage(BuildContext context, Country country) async {
    MaterialPageRoute path = MaterialPageRoute(builder: (context) {
      return CountryDetail(country);
    });
    Navigator.push(context, path);
  }

  void clickFavorite(Country _country) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (widget.favoriteCounties.contains(_country.countryCode)) {
      widget.favoriteCounties.remove(_country.countryCode);
    } else {
      widget.favoriteCounties.add(_country.countryCode);
    }

    prefs.setStringList("favorite", widget.favoriteCounties);
    setState(() {});
  }
}
