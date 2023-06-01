import 'package:flutter/material.dart';
import '../config/colors.dart';
import '../models/game_model.dart';
import '../services/game_service.dart';
import 'favorite_page.dart';
import 'game_detail_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameModel> _games = [];
  String? _selectedFilter;
  List<GameModel>? _filteredGames;

  @override
  void initState() {
    super.initState();
    _fetchGames();
    _selectedFilter = null;
  }

  Future<void> _fetchGames() async {
    try {
      final gameService = GameService();
      final games = await gameService.fetchGames();
      setState(() {
        _games = games;
        _filteredGames = List.from(_games);
      });
      setState(() {
        _games = games;
      });
    } catch (error) {
      print('Failed to fetch games: $error');
    }
  }

  void _navigateToGameDetail(GameModel game) {
    Navigator.pushNamed(
      context,
      GameDetailPage.routeName,
      arguments: game,
    );
  }

  void _navigateToGameFavorite(List<GameModel> games) {
    Navigator.pushNamed(
      context,
      FavoritePage.routeName,
      arguments: games,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'FreeGames',
              style: TextStyle(
                color: text,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Filter by genre:', style: TextStyle(color: text)),
            ),
            DropdownButton<String>(
              focusColor: secondary,
              dropdownColor: primary,
              style: TextStyle(color: text),
              value: _selectedFilter,
              onChanged: (value) {
                setState(() {
                  _selectedFilter = value;
                  _filterGames();
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'All',
                  child: Text('All'),
                ),
                DropdownMenuItem(
                  value: 'Shooter',
                  child: Text('Shooter'),
                ),
                DropdownMenuItem(
                  value: 'Strategy',
                  child: Text('Strategy'),
                ),
                DropdownMenuItem(
                  value: 'Battle Royale',
                  child: Text('Battle Royale'),
                ),
                DropdownMenuItem(
                  value: 'MMORPG',
                  child: Text('MMORPG'),
                ),
                DropdownMenuItem(
                  value: 'Fighting',
                  child: Text('Fighting'),
                ),
              ],
            ),
          ]),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _filteredGames?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemBuilder: (context, index) {
                final game = _filteredGames?[index];
                return GestureDetector(
                  onTap: () => _navigateToGameDetail(game!),
                  child: Card(
                    color: secondary,
                    child: Column(
                      children: [
                        Image.network(game?.thumbnail ?? ''),
                        const SizedBox(height: 8.0),
                        Text(game?.title ?? '',
                            style: const TextStyle(color: text)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the FavoritePage
          _navigateToGameFavorite(_games);
        },
        backgroundColor: text,
        child: const Icon(Icons.favorite, color: primary),
      ),
    );
  }

  void _filterGames() {
    if (_selectedFilter == 'Shooter') {
      _filteredGames = _games.where((game) => game.genre == 'Shooter').toList();
    } else if (_selectedFilter == 'Strategy') {
      _filteredGames =
          _games.where((game) => game.genre == 'Strategy').toList();
    } else if (_selectedFilter == 'Battle Royale') {
      _filteredGames =
          _games.where((game) => game.genre == 'Battle Royale').toList();
    } else if (_selectedFilter == 'MMORPG') {
      _filteredGames = _games.where((game) => game.genre == 'MMORPG').toList();
    } else if (_selectedFilter == 'Fighting') {
      _filteredGames =
          _games.where((game) => game.genre == 'Fighting').toList();
    } else if (_selectedFilter == null || _selectedFilter == 'All'){
      _filteredGames = List.from(_games);
    }
  }
}
