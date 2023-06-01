import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/game_model.dart';

class GameService {
  static const String apiUrl = 'https://www.freetogame.com/api/games';

  Future<List<GameModel>> fetchGames() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final gamesList = jsonData as List<dynamic>;

      return gamesList.map((gameJson) => GameModel.fromJson(gameJson)).toList();
    } else {
      throw Exception('Failed to fetch games. Status code: ${response.statusCode}');
    }
  }
}
