import 'package:flutter_projects/data/entities/cost.dart';
import 'package:flutter_projects/data/entities/target.dart';

class Category {
  final int id;
  final String name;
  final String description;
  final String color;
  List<Target> targets;
  List<Cost> costs;

  Category({
    this.id = 0,
    required this.name,
    required this.description,
    required this.color,
    this.targets = const [],
    this.costs = const [],
  });

  Map<String, dynamic> toDbJson() {
    return {
      "name": name,
      "description": description,
      "color": color
    };
  }

  factory Category.fromDbJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      color: json["color"]
    );
  }
}