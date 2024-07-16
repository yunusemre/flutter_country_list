import 'package:flutter/material.dart';
import 'package:world_country/country.dart';

class CountryDetail extends StatelessWidget {
  final Country _country;

  CountryDetail(this._country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(_country.name),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: double.infinity,
        height: 32,
      ),
      Image.network(
        _country.flags,
        width: MediaQuery.sizeOf(context).width / 2,
        fit: BoxFit.fitWidth,
      ),
      SizedBox(height: 12),
      _buildAllRow()
    ]);
  }

  Widget _buildAllRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(children: [
        _buildDetailRow("Country Name: ", _country.name),
        _buildDetailRow("Country Region: ", _country.region),
        _buildDetailRow("Country population: ", _country.population.toString()),
      ]),
    );
  }

  Widget _buildDetailRow(String key, dynamic value) {
    return Row(children: [
      Expanded(
        flex: 2,
        child: Text(
          key,
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.end,
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        flex: 2,
        child: Text(
          value,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
