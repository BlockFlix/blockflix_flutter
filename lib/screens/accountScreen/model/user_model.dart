import 'package:blockflix/screens/homeScreen/model/movie_model.dart';

class UserModel {
  int id;
  String userName;
  String email;
  String privateKey;
  DateTime dob;
  List<Movie> boughtMovies;
  UserModel(
      {required this.id,
      required this.userName,
      required this.email,
      required this.dob,
      required this.privateKey,
      required this.boughtMovies
    });
}
