import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mnutritionix/models/item.dart';


class itemAPI {
  late String name;
  static Future<List<item>> getItem(name) async {
    var uri = Uri.https("nutritionix-api.p.rapidapi.com", '/v1_1/search/$name',
        {"fields": "item_name,item_id,brand_name,nf_calories,nf_total_fat,nf_cholesterol,nf_sodium,nf_total_carbohydrate,nf_protein,nf_serving_weight_grams"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-host": "nutritionix-api.p.rapidapi.com",
      "x-rapidapi-key": "28c3c3bdb3msh7334e7bbf6052e4p163a3djsn47fe45ecda34",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for(var i in data['hits']) {
      _temp.add(i['fields']);
    }

    return item.itemsFromSnapshot(_temp);
  }
} 