class Meal {
  final String name;
  final String thumbnail;
  final String id;
  final String? category;
  final String? area;

  Meal({
    required this.name,
    required this.thumbnail,
    required this.id,
    this.category,
    this.area,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      name: json['strMeal'],
      thumbnail: json['strMealThumb'],
      id: json['idMeal'],
      category: json['strCategory'],
      area: json['strArea']
    );
  }
}
