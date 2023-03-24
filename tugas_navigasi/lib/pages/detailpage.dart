import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tugas_navigasi/data/data.dart';

class DetailPage extends StatelessWidget {
  final TourismPlace tourismPlace;

  const DetailPage({super.key, required this.tourismPlace});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tourismPlace.name),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.network(tourismPlace.imageUrls.first),
              Text(tourismPlace.name),
              Text(tourismPlace.location),
              Text(tourismPlace.description),
            ],
          ),
        ));
  }
}
