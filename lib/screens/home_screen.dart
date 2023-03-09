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
  List<dynamic>? countryData;
  // bool _isLoading = true;
  final List<Widget> images = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    countryData = await CountryApi.getCountries();
    print(countryData);

    // setState(() {
    //   _isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cities App'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                width: 400,
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      inputQuery = text;
                    });
                    print(inputQuery);
                  },
                ),
              ),
            )
          ],
        ),
        // body: Center(
        //   child: ElevatedButton(
        //     onPressed: () {

        //     },
        //     child: const Text('Click Me'),
        //   ),
        // ),
        body: ListView.builder(
            itemCount: countryData?.length,
            itemBuilder: (context, index) {
              return CountryCard(
                countryNames: countryData?[0],
                flagURLS: countryData?[1],
              );
            }));
  }
}
