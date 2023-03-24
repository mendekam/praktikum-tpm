import 'package:flutter/material.dart';
import 'package:tugas_navigasi/data/data.dart';

import 'detailpage.dart';

class HomePage extends StatelessWidget {
  var username;

  HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final TourismPlace tourismPlace;
    return Scaffold(
      appBar: AppBar(
        title: Text("User : $username"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(tourismPlace: tourismPlaceList[index]);
              }));
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.network(
                    tourismPlaceList[index].imageUrls.first,
                    width: 100,
                    height: 100,
                  ),
                  Text(tourismPlaceList[index].name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
