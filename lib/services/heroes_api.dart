import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:heros/models/hero_model.dart';
import 'package:http/http.dart' as http;

Future<HeroResponse> searchHero(String searchText, String sortBy) async {
  HeroResponse heroResponse = HeroResponse(status: "404", heroesList: []);
  await http.post(
    Uri.https('localhost','/heroes_api/search_hero.php'),
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

Future<HeroResponse> allHeroes(String sortBy) async {
  HeroResponse heroResponse = HeroResponse(status: "404", heroesList: []);
  await http.post(
    Uri.https('localhost','/heroes_api/all_heroes.php'),
    body: {
      'sortBy': sortBy
    },
  ).then((response) {
    if (response.statusCode == 200) {
      heroResponse = HeroResponse.fromJson(jsonDecode(response.body));
      } else {
        print("retrieve all heroes failed");
        heroResponse = HeroResponse(status: "404", heroesList: []);
      }
  }).catchError((e) {
    print("retrieve all heroes failed");
    heroResponse = HeroResponse(status: "404", heroesList: []);
  });
  return heroResponse;
}

