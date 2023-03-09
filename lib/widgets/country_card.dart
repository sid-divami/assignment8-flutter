import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  final List<String> countryNames;
  final List<String> flagURLS;
  const CountryCard(
      {super.key, required this.countryNames, required this.flagURLS});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              child: Container(
                width: 400,
                height: 400,
                child: Center(
                  child: Text(countryNames[index]),
                ),
                //   decoration: BoxDecoration(
                //       image: DecorationImage(image: Image.network(flagURLS[index]))),
                // )
              ),
            ));
      },
    );
  }
}
