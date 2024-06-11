
import 'package:itss2/models/sport.dart';

class Match {
  int? id;
  String? time;
  int? price;
  DateTime? date;
  bool? status;

  Match({this.id, this.time, this.price, this.date,this.status = false});
}

Match match1 = Match(id: 1,time: "6:00AM-8:00AM",price: 700000,date: DateTime(2023,10,6));
Match match2 = Match(id: 2,time: "8:00AM-10:00AM",price: 700000,date: DateTime(2023,10,6));
Match match3 = Match(id: 3,time: "10:00AM-12:00AM",price: 700000,date: DateTime(2023,10,6));
Match match4 = Match(id: 4,time: "12:00AM-2:00PM",price: 700000,date: DateTime(2023,10,6));
Match match5 = Match(id: 5,time: "2:00PM-4:00PM",price: 700000,date: DateTime(2023,10,6));
Match match6 = Match(id: 6,time: "4:00PM-6:00PM",price: 700000,date: DateTime(2023,10,6));
Match match7 = Match(id: 7,time: "6:00PM-8:00PM",price: 700000,date: DateTime(2023,10,6));
Match match8 = Match(id: 8,time: "8:00PM-10:00PM",price: 700000,date: DateTime(2023,10,6));
Match match9 = Match(id: 9,time: "10:00PM-12:00PM",price: 700000,date: DateTime(2023,10,6));

List<Match> field1matches = [match1,match2,match3,match4,match5,match6,match7,match8,match9];