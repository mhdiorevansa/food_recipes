import 'package:food_recipes/models/categories.dart';
import 'package:food_recipes/models/meal.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FoodApiService {
  static Future<List<dynamic>> fetchAllMeal() async {
    final url = Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/search.php?s=',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['meals'];
      return data.map((meal) => Meal.fromJson(meal)).toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }

  static Future<dynamic> fetchDetailSeafoodMeal(String id) async {
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

  static Future<dynamic> fetchCategoriesMeal() async {
    final url = Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/categories.php',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['categories'];
      return data.map((category) => Categories.fromJson(category)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
