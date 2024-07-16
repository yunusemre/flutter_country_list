class Country {
  String name;
  String countryCode;
  String capital;
  String region;
  String language;
  String flags;
  int population;

  Country.fromMap(Map<String, dynamic> country)
      : name = country["name"]["common"] ?? "",
        countryCode = country["cca2"] ?? "",
        capital = (country["capital"] as List<dynamic>).isNotEmpty
            ? country["capital"][0]
            : "",
        region = country["region"] ?? "",
        language = (country["languages"] as Map<String, dynamic>).isNotEmpty
            ? (country["languages"] as Map<String, dynamic>)
                .entries
                .toList()[0]
                .value
            : "",
        population = country["population"],
        flags = country["flags"]?["png"];
}

/*
* {
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
  * */
