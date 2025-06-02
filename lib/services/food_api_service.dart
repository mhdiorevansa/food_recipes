import 'package:food_recipes/models/meal.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FoodApiService {
  static Future<List<Meal>> fetchSeafoodMeal() async {
    final url = Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['meals'];
      return data.map((meal) => Meal.fromJson(meal)).toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }

  static Future<Meal> fecthDetailSeafoodMeal(String id) async {
    final url = Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['meals'][0];
      return Meal.fromJson(data);
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
