class MovieDetailModel {
  String imageUrl;
  String name;
  bool isBought;
  int year;
  List<String> genreList;
  String plot;
  List<String> cast;
  MovieDetailModel(
      {required this.cast,
      required this.genreList,
      required this.imageUrl,
      required this.isBought,
      required this.name,
      required this.plot,
      required this.year});
}
