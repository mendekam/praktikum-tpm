import 'package:flutter/material.dart';
import 'package:kuis/pages/groceriesdetail.dart';

import '../data/groceries.dart';

class GroceriesList extends StatelessWidget {
  const GroceriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceryList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GroceriesDetail(groceries: groceryList[index],)));

            },
            child: GroceriesCard(groceries: groceryList[index]));
      },
    );
  }
}

class GroceriesCard extends StatelessWidget {
  final Groceries groceries;

  const GroceriesCard({Key? key, required this.groceries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Image.network(
            groceries.productImageUrls[0],
            fit: BoxFit.fitWidth,
            height: 200,
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
                const SizedBox(height: 16.0),
                Text(
                  "Stock: ${groceries.stock}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
