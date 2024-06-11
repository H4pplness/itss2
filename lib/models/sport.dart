class Sport {
  int? id;
  String? name;

  Sport({this.id, this.name});
}

Sport football = Sport(id: 1, name: "Bóng đá");
Sport badminton = Sport(id: 2, name: "Cầu lông");
Sport basketball = Sport(id: 3, name: "Bóng rổ");

List<Sport> listSport = [football, badminton, basketball];
