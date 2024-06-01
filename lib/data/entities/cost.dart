class Cost {
  final int id;
  final String createdAt;
  final int price;
  final String description;
  final int categoryId;

  Cost({
    this.id = 0,
    required this.createdAt,
    required this.price,
    required this.description,
    this.categoryId = 0
  });

  Map<String, dynamic> toDbJson() {
    return {
      "created_at": createdAt,
      "price": price,
      "description": description,
      "category_id": categoryId
    };
  }

  factory Cost.fromDbJson(Map<String, dynamic> json) {
    return Cost(
      id: json["id"],
      createdAt: json["created_at"],
      price: json["price"],
      description: json["description"],
      categoryId: json["category_id"]
    );
  }
}