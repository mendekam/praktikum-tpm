import 'package:flutter/material.dart';
import 'package:kuis/data/groceries.dart';
import 'package:url_launcher/url_launcher.dart';

class GroceriesDetail extends StatelessWidget {
  final Groceries groceries;
  const GroceriesDetail({Key? key, required this.groceries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(groceries.name),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              groceries.productImageUrls[0],
              fit: BoxFit.fitWidth,
              height: 200,
            ),
            TextButton(
              onPressed: () {
                final url = Uri.parse(groceries.productUrl);
                launchUrl(url);
              },
              child: Text("Link"),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    groceries.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    groceries.price,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    groceries.description,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "Stock: ${groceries.stock}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
