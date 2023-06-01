import 'package:flutter/material.dart';
import 'package:project_akhir/models/game_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/colors.dart';
import '../services/favorite_service.dart';
import 'home_page.dart';
import 'navigation_page.dart';

class GameDetailPage extends StatelessWidget {
  static const String routeName = '/game_detail';
  final GameModel game;
  const GameDetailPage({Key? key, required this.game}) : super(key: key);

  bool homePagePredicate(Route<dynamic> route) {
    return route.isFirst && route.settings.name == HomePage.routeName;
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = FavoriteService.isFavorite(game);
    return WillPopScope(
      onWillPop: () async {
        Navigator.popUntil(context, homePagePredicate);
        Navigator.pushNamed(context, NavigationPage.routeName);
        return false;
      },
      child: Scaffold(
        backgroundColor: primary,
        appBar: AppBar(
          title: Text(game.title, style: TextStyle(color: text)),
          actions: [
            IconButton(
              color: text,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? text : null,
              ),
              onPressed: () {
                if (isFavorite) {
                  FavoriteService.removeFavorite(game);
                } else {
                  FavoriteService.addFavorite(game);
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(isFavorite
                        ? 'Removed from favorites'
                        : 'Added to favorites'),
                    duration: Duration(seconds: 1),
                  ),
                );
                Navigator.popAndPushNamed(context, routeName, arguments: game);
              },
            ),
          ],
          backgroundColor: secondary,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(game.thumbnail),
              SizedBox(height: 16.0),
              Text(
                game.title,
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: primary),
              ),
              SizedBox(height: 8.0),
              Container(
                alignment: Alignment.center,
                child: Text(
                  game.title,
                  style: TextStyle(fontSize: 25.0, color: text),
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                alignment: Alignment.center,
                child: Text(
                  game.shortDescription,
                  style: TextStyle(fontSize: 18.0, color: text, decorationStyle: TextDecorationStyle.wavy),
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Genre: ${game.genre}',
                style: TextStyle(fontSize: 18.0, color: text),
              ),
              SizedBox(height: 8.0),
              Text(
                'Platform: ${game.platform}',
                style: TextStyle(fontSize: 18.0, color: text),
              ),
              SizedBox(height: 8.0),
              Text(
                'Publisher: ${game.publisher}',
                style: TextStyle(fontSize: 18.0, color: text),
              ),
              SizedBox(height: 8.0),
              Text(
                'Developer: ${game.developer}',
                style: TextStyle(fontSize: 18.0, color: text),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: text,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    launchUrl(Uri.parse(game.gameUrl));
                  },
                  child: Text(
                    "Open Game",
                    style: TextStyle(fontSize: 18.0, color: primary),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
