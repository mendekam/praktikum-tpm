import '../models/game_model.dart';

class FavoriteService {
  static List<GameModel> _favorites = [];

  static bool isFavorite(GameModel game) {
    return _favorites.any((favGame) => favGame.id == game.id);
  }

  static void addFavorite(GameModel game) {
    if (!_favorites.contains(game)) {
      _favorites.add(game);
    }
  }

  static void removeFavorite(GameModel game) {
    _favorites.removeWhere((favGame) => favGame.id == game.id);
  }

  static List<GameModel> getFavorites() {
    return _favorites;
  }
}
