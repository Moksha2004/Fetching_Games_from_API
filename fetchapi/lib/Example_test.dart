import 'package:flutter/material.dart';

class Movie {
  final String title;
  final String subtitle;
  final String releaseDate;
  final String image;

  Movie(this.title, this.subtitle, this.releaseDate, this.image);
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            width: 80,
            child: Image.network(
              movie.image,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(movie.subtitle),
                  Spacer(),
                  Text(
                    'Released on: ${movie.releaseDate}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MoviesList extends StatefulWidget {
  const MoviesList({Key? key}) : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  final List<Movie> _movies = [
    Movie(
      'Avengers: Endgame',
      'Action, Adventure, Drama',
      '2019-04-26',
      'https://www.themoviedb.org/t/p/original/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
    ),
    Movie(
      'The Shawshank Redemption',
      'Drama, Crime',
      '1994-09-23',
      'https://www.themoviedb.org/t/p/original/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg',
    ),
    Movie(
      'The Godfather',
      'Drama, Crime',
      '1972-03-14',
      'https://www.themoviedb.org/t/p/original/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
    ),
    Movie(
      'The Dark Knight',
      'Action, Crime, Drama, Thriller',
      '2008-07-18',
      'https://www.themoviedb.org/t/p/original/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
    ),
  ];

  List<Movie> _filteredMovies = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: TextField(
        controller: _searchController,
        decoration: InputDecoration(
        hintText: 'Search movies...',
        hintStyle: TextStyle(color: Colors.white70),
    border: InputBorder.none,
    ),
    style: TextStyle(color: Colors.white),
          onChanged: (value) {
            setState(() {
              _filteredMovies = _movies
                  .where((movie) => movie.title
                  .toLowerCase()
                  .contains(value.toLowerCase()))
                  .toList();
            });
          },

        ),
        ),
      body: ListView.builder(
        itemCount: _filteredMovies.length,
        itemBuilder: (context, index) {
          final movie = _filteredMovies[index];
          return MovieCard(movie: movie);
        },
      ),
    );
  }
}