import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tugas_http/api/httpservice.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder(
        future: httpService.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      snapshot.data[index].image,
                      fit: BoxFit.cover,
                      width: 100,
                    ),
                    title: Text(snapshot.data[index].title),
                    subtitle: Text(snapshot.data[index].description),
                    trailing: Text(snapshot.data[index].price.toString()),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator(color: Colors.blueGrey),);
        },
      ),
    );
  }
}
