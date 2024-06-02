import 'package:flutter_projects/data/entities/saving.dart';

class Target {
  final int id;
  final double price;
  final String name;
  final String description;
  final int priority;
  final String firstDate;
  final String lastDate;
  final double progress;
  final int categoryId;
  List<Saving> savings;

  Target({
    this.id = 0,
    required this.price,
    required this.name,
    required this.description,
    required this.priority,
    required this.firstDate,
    required this.lastDate,
    this.progress = 0.0,
    this.categoryId = 0,
    this.savings = const []
  });

  Map<String, dynamic> toDbJson() {
    return {
      "price": price,
      "name": name,
      "description": description,
      "priority": priority,
      "first_date": firstDate,
      "last_date": lastDate,
      "progress": progress,
      "category_id": categoryId
    };
  }

  factory Target.fromDbJson(Map<String, dynamic> json) {
    return Target(
      id: json["id"],
      price: json["price"],
      name: json["name"],
      description: json["description"],
      priority: json["priority"],
      firstDate: json["first_date"],
      lastDate: json["last_date"],
      progress: json["progress"],
      categoryId: json["category_id"]
    );
  }
}