import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../utils/movie_service.dart';
import 'movie_detail.dart';

const BASE_IMAGE_PATH = 'https://image.tmdb.org/t/p/w92/';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final List<Movie> movies = [];
  bool isSearchMode = false;

  @override
  void initState() {
    fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchField = TextField(
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        labelText: 'Search movies... (Venom, Naruto, anything)',
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      onSubmitted: onSearchSubmit,
    );

    return Scaffold(
      appBar: AppBar(
        title: isSearchMode ? searchField : const Text('K3519010 - Movies App'),
        actions: [
          IconButton(
            icon: Icon(isSearchMode ? Icons.cancel : Icons.search),
            onPressed: () => setState(() {
              isSearchMode = !isSearchMode;
            }),
          ),
          isSearchMode
              ? const SizedBox.shrink()
              : IconButton(
                  icon: const Icon(Icons.refresh), onPressed: fetchMovies)
        ],
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return Card(
            child: ListTile(
              title: Text(movie.title),
              subtitle: Text(
                'Released: ${movie.releaseDate} - Vote: ${movie.voteAverage.toString()}',
              ),
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage('$BASE_IMAGE_PATH${movie.posterPath}'),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetail(movie: movie),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onSearchSubmit(String text) async {
    if (text.isNotEmpty) {
      final movies = await MovieService.find(text);

      setState(() {
        this.movies.clear();
        this.movies.addAll(movies);
      });
    }
  }

  fetchMovies() async {
    final movies = await MovieService.getUpcoming();

    setState(() {
      this.movies.clear();
      this.movies.addAll(movies);
    });
  }
}
