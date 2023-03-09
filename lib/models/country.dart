class Country {
  final String countryName;
  final String capital;
  final String flagURL;
  final String currency;

  Country(
      {required this.countryName,
      required this.capital,
      required this.flagURL,
      required this.currency});
  factory Country.fromJson(dynamic json) {
    return Country(
        countryName: json['name']['common'] as String,
        capital: json['capital'] as String,
        flagURL: json['flags']['png'] as String,
        currency: json['currencies '].keys[0] as String);
  }
  static List<Country> countryFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Country.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Country {name: $countryName, capital:$capital, flagURL: $flagURL, currency: $currency}';
  }
}
