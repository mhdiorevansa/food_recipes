class Categories {
  final String id;
  final String name;

  Categories({required this.id, required this.name});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(id: json['idCategory'], name: json['strCategory']);
  }
}
