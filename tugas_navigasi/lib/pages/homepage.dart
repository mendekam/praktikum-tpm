import 'package:flutter/material.dart';
import 'package:tugas_navigasi/data/data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TourismPlace tourismPlace;
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Image.asset(
                  tourismPlaceList[index].imageAsset,
                  width: 100,
                  height: 100,
                ),
                Text(tourismPlaceList[index].name),
                Text(tourismPlaceList[index].location),
                Text(tourismPlaceList[index].description),
              ],
            ),
          );
        },
      ),
    );
  }
}
