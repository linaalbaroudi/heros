import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:heros/models/hero_model.dart';
import 'package:http/http.dart' as http;

Future<HeroResponse> searchHero(String searchText, String sortBy) async {
  HeroResponse heroResponse = HeroResponse(status: "404", heroesList: []);
  await http.post(
    Uri.https('hydrojeenapp.herokuapp.com','/api/v1/users/addnewdevice'),
    //Uri.parse('https://hydrojeenapp.herokuapp.com/api/v1/users/addnewdevice'),
    body: {
      'searchText': searchText,
      'sortBy': sortBy
    },
  ).then((response) {
    if (response.statusCode == 200) {
      heroResponse = HeroResponse.fromJson(jsonDecode(response.body));
      } else {
        print("search failed");
        heroResponse = HeroResponse(status: "404", heroesList: []);
      }
  }).catchError((e) {
    print("search failed");
    heroResponse = HeroResponse(status: "404", heroesList: []);
  });
  return heroResponse;
}
