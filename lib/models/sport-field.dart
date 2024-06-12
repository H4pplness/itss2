import 'package:itss2/models/match.dart';
import 'package:itss2/models/sport.dart';

/**
 * Sân thể thao
 */

class SportField {
  int? id;
  String? name;
  String? location;
  Sport? sport;
  List<Match>? matches;
  String? image;

  SportField({this.id, this.name, this.location, this.matches, this.sport, this.image});
}

SportField field1 = SportField(
    id: 1,
    name: "Sân bóng 1 Bách Khoa",
    location: "Đường Lê Thanh Nghị,Bách Khoa,Hai Bà Trưng,Hà Nội",
    sport: football,
    image: "assets/san-1.jpg",
    matches: field1matches);
SportField field2 = SportField(
    id: 2,
    name: "Sân bóng 2 Bách Khoa",
    location: "Đường Lê Thanh Nghị,Bách Khoa,Hai Bà Trưng,Hà Nội",
    image: "assets/san-2.jpg",
    sport: football);
SportField field3 = SportField(
    id: 3,
    name: "Sân bóng 3 Bách Khoa",
    location: "Đường Lê Thanh Nghị,Bách Khoa,Hai Bà Trưng,Hà Nội",
    image: "assets/san-3.jpg",
    sport: football);
SportField field4 = SportField(
    id: 4,
    name: "Sân bóng 4 Bách Khoa",
    location: "Đường Lê Thanh Nghị,Bách Khoa,Hai Bà Trưng,Hà Nội",
    image: "assets/san-4.jpg",
    sport: football);

SportField field5 = SportField(
    id: 5,
    name: "Sân cầu lông 1 Bách Khoa",
    location: "Đường Lê Thanh Nghị,Bách Khoa,Hai Bà Trưng,Hà Nội",
    image: "assets/san-5.jpg",
    sport: badminton);
SportField field6 = SportField(
    id: 6,
    name: "Sân cầu lông 2 Bách Khoa",
    location: "Đường Lê Thanh Nghị,Bách Khoa,Hai Bà Trưng,Hà Nội",
    image: "assets/san-6.jpg",
    sport: badminton);
SportField field7 = SportField(
    id: 7,
    name: "Sân cầu lông 3 Bách Khoa",
    location: "Đường Lê Thanh Nghị,Bách Khoa,Hai Bà Trưng,Hà Nội",
    image: "assets/san-1.jpg",
    sport: badminton);
SportField field8 = SportField(
    id: 8,
    name: "Sân cầu lông 4 Bách Khoa",
    location: "Đường Lê Thanh Nghị,Bách Khoa,Hai Bà Trưng,Hà Nội",
    image: "assets/san-2.jpg",
    sport: badminton);


List<SportField> listSportField = [field1,field2,field3,field4,field5,field6,field7,field8];