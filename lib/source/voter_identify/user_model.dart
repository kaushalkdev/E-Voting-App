import 'package:e_voting_app/source/index.dart';

class UserModel {
  final String userAdhar;
  final bool isVoted;

  UserModel({
    @required this.userAdhar,
    @required this.isVoted,
  });
}
