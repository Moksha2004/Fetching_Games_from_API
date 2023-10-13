import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _games = [];
  List<dynamic> _filteredGames = [];

  @override
  void initState() {
    super.initState();
    fetchGames();
  }

  Future<void> fetchGames() async {
    final response = await http.get(
        Uri.parse('https://www.mmobomb.com/api/games/all'));

    if (response.statusCode == 200) {
      setState(() {
        _games = jsonDecode(response.body);
        _filteredGames = _games;
      });
    } else {
      throw Exception('Failed to load games');
    }
  }

  void filterGames(String platform) {
    setState(() {
      if (platform == 'all') {
        _filteredGames = _games;
      } else {
        _filteredGames = _games.where((game) => game['platform'] == platform).toList();
      }
    });
  }

  void searchGames(String searchQuery) {
    setState(() {
      _filteredGames = _games.where((game) => game['title'].toLowerCase().contains(searchQuery.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Games'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Games',
                suffixIcon: IconButton(
                  onPressed: () {
                    _searchController.clear();
                    searchGames('');
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
              onChanged: (value) => searchGames(value),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => filterGames('all'),
                child: Text('All'),
              ),
              ElevatedButton(
                onPressed: () => filterGames('pc'),
                child: Text('PC'),
              ),
              ElevatedButton(
                onPressed: () => filterGames('browser'),
                child: Text('Browser'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredGames.length,
              itemBuilder: (BuildContext context, int index) {
                final game = _filteredGames[index];
                return ListTile(
                  leading: Image.network(game['thumbnail']),
                  title: Text(game['title']),
                  subtitle: Text('${game['genre']} - ${game['platform']} - ${game['release_date']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
