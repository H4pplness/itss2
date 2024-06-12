
import 'package:itss2/models/user.dart';
import 'package:itss2/models/match.dart';

class Booking {
  String? id;
  Match? match;
  User? user;

  Booking({this.id,this.match, this.user});
}

List<Booking> bookings = [];