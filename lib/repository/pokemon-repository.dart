import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testeBloc/models/pokemon-model.dart';

import '../models/pokemon-model.dart';

class ApiPokemon {
  Future<List<Pokemon>> getAllPokemon() async {
    http.Response response =
        await http.get("https://pokeapi.co/api/v2/pokemon");

    return decode(response);
  }

  List<Pokemon> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      /* List<Pokemon> pokemons = decoded['results'].map<Pokemon>((map) {
        print(map['name']);
        return Pokemon.fromJson(map);
      }).toList(); */
      return Pokemon.fromJsonList2(decoded['results']);
      //return pokemons;
    } else {
      throw Exception("Failed to load videos");
    }
  }
}
