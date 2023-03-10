import 'package:cities_flutter/models/country.api.dart';
import 'package:cities_flutter/models/country.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:vertical_card_pager/vertical_card_pager.dart';
import '../widgets/country_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputQuery = '';
  List<dynamic>? countriesData;
  // bool _isLoading = true;
  final List<Widget> images = [];
  @override
  void initState() {
    super.initState();
    getData();
    // print('postGETDATa');
    // print(countriesData);
  }

  Future<void> getData() async {
    countriesData = await CountryApi.getCountries();
  }

  Future<void> getCountrybyName(countryName) async {
    countriesData = await CountryApi.getCountrybyName(countryName);
  }

  @override
  Widget build(BuildContext context) {
    // print("Inside the homescfeenn");
    // print(countriesData);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cities App'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 400,
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      inputQuery = text;
                    });
                    getCountrybyName(inputQuery);
                    //    print(inputQuery);
                  },
                ),
              ),
            )
          ],
        ),
        body: Center(
          child: ListView.builder(itemBuilder: (context, index) {
            return CountryCard(
              countryData: countriesData?[index],
            );
          }),
        )
        // body: Padding(
        //   padding: EdgeInsets.all(20),
        //   child: ListView.builder(itemBuilder: (context , index){
        //     return
        //   },),
        // )
        );
  }
}
