class HeroResponse {
  String? status;
  List<HeroModel>? heroesList;

  HeroResponse({
    required this.status,
    required this.heroesList,
  });

  HeroResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['heroes'] != null) {
      heroesList = [];
      json['heroes'].forEach((hero) {
        heroesList!.add(HeroModel.fromJson(hero));
      });
    }
  }
}

class HeroModel {
  String? name;
  String? description;
  //List<String>? powers;
  String? powers;
  int? rate;

  HeroModel({
    required this.name,
    required this.description,
    required this.powers,
    required this.rate
  });

  HeroModel.fromJson(Map<String, dynamic> json) {
    if (json['status'] == 200) {
      name = json['name'];
      description = json['description'];
      // json['powers'].forEach((p) {
      //   powers!.add(p);
      // });
      powers = json['powers'];
      rate = json['rate'];
    }
  }
}