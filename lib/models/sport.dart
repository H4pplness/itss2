class Sport {
  String? name;
  String? englishName;

  Sport({this.englishName, this.name});
}

Sport football = Sport(name: "Bóng đá",englishName: "football");
Sport badminton = Sport(name: "Cầu lông",englishName: "badminton");
Sport basketball = Sport(name: "Bóng rổ",englishName: "basketball");

List<Sport> listSport = [football, badminton, basketball];
