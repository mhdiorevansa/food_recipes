class Meal {
  final String name;
  final String thumbnail;
  final String id;
  final String? category;
  final String? area;
  final List<String>? ingredients;
  final List<String>? measures;

  Meal({
    required this.name,
    required this.thumbnail,
    required this.id,
    this.category,
    this.area,
    this.ingredients,
    this.measures
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];
    json.forEach((key, value) {
      if (key.startsWith('strIngredient') &&
          value != null &&
          value.toString().trim().isNotEmpty) {
        ingredients.add(value.toString());
      } else if (key.startsWith('strMeasure') &&
          value != null &&
          value.toString().trim().isNotEmpty) {
        measures.add(value.toString());
      }
    });
    return Meal(
      name: json['strMeal'],
      thumbnail: json['strMealThumb'],
      id: json['idMeal'],
      category: json['strCategory'],
      area: json['strArea'],
      ingredients: ingredients,
      measures: measures
    );
  }
}
