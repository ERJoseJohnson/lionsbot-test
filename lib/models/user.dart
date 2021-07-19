import 'package:lionsbot_test/constants.dart';
import 'package:lionsbot_test/models/achievement.dart';

class User {
  String username;
  int cleaningHours;
  List<Achievement> pointsList;
  List<Achievement> badgesList;

  User({required this.username, required this.cleaningHours, required this.pointsList, required this.badgesList});

}