import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Game {
  final String title;
  final String thumbnail;
  final String description;

  Game({
    required this.title,
    required this.thumbnail,
    required this.description,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      title: json['title'],
      thumbnail: json['thumbnail'],
      description: json['short_description'],
    );
  }
}

class GamesScreen extends StatefulWidget {
  @override
  _GamesScreenState createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  List<Game> _games = [];

  @override
  void initState() {
    super.initState();
    _fetchGames();
  }

  Future<void> _fetchGames() async {
    final response = await http.get(Uri.parse('https://www.mmobomb.com/api1/games'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List<dynamic>;
      final games = jsonData.map((gameData) => Game.fromJson(gameData)).toList();
      setState(() {
        _games = games;
      });
    } else {
      throw Exception('Failed to fetch games');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Games'),
      ),
      body: ListView.builder(
        itemCount: _games.length,
        itemBuilder: (context, index) {
          final game = _games[index];
          return ListTile(
            leading: Image.network(game.thumbnail),
            title: Text(game.title),
            subtitle: Text(game.description),
          );
        },
      ),
    );
  }
}
