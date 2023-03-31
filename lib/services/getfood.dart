import 'dart:convert';

import 'package:flutter_cinema_app/model/food/get_data.dart';

import 'package:http/http.dart' as http;
class FoodService {
  static Future<List<getFood>> orderFood() async {
    const  url = "https://6415ae86351c4aed490c9195.mockapi.io/food";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if ( response.statusCode == 200){
      List<dynamic> jsonList = jsonDecode(response.body);
      List<getFood> food = jsonList.map((e) => getFood.fromJson(e)).toList();
      return food;
    }
    else {
      throw Exception("Failed to get food");
    }
  }
}