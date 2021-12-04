class Movie {
  int id;
  String title;
  double voteAverage;
  String releaseDate;
  String overview;
  String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    required this.overview,
    required this.posterPath,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'],
      title: map['title'],
      voteAverage: map['vote_average'] * 1.0,
      releaseDate: map['release_date'],
      overview: map['overview'],
      posterPath: map['poster_path'],
    );
  }
}
