import 'package:flutter_projects/data/entities/cost.dart';
import 'package:flutter_projects/data/entities/target.dart';

class Category {
  final String name;
  final String? description;
  final String? color;
  final int cost;
  final int status;
  final List<Target>? targets;
  final List<Cost>? costs;

  Category({
    required this.name,
    required this.description,
    required this.color,
    required this.cost,
    required this.status,
    required this.targets,
    required this.costs,
  });
}