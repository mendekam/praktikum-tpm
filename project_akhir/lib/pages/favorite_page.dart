import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../models/game_model.dart';
import '../services/favorite_service.dart';
import 'game_detail_page.dart';
import 'home_page.dart';

class FavoritePage extends StatelessWidget {
  static const routeName = '/favorite';

  bool homePagePredicate(Route<dynamic> route) {
    return route.settings.name == HomePage.routeName;
  }

  @override
  Widget build(BuildContext context) {
    final favoriteGames = FavoriteService.getFavorites();

    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        title: Text('Favorite Games'),
        backgroundColor: secondary,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: favoriteGames.length,
        itemBuilder: (context, index) {
          final game = favoriteGames[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                GameDetailPage.routeName,
                arguments: game,
              );
            },
            child: Card(
              color: secondary,
              child: Column(
                children: [
                  Image.network(game.thumbnail),
                  SizedBox(height: 8.0),
                  Text(game.title, style: TextStyle(color: text)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
