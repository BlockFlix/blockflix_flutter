class Movie {
  int id;
  String name;
  int year;
  String duration;
  List<String> genre;
  String imageUrl;
  String plot;
  Movie(
      {required this.name,
      required this.id,
      required this.duration,
      required this.year,
      required this.genre,
      required this.imageUrl,
      required this.plot});
}
