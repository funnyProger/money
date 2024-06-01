import 'package:flutter_projects/data/entities/cost.dart';
import '../entities/category.dart';
import '../entities/saving.dart';
import '../entities/target.dart';
import 'database_methods.dart';

abstract class IDatabase {
  Future<bool> addCost(Cost cost);
  Future<bool> addCategory(Category category);
  Future<bool> addTarget(Target target);
  Future<bool> addSaving(Saving saving);
  Future<List<Category>?> getCategories();
  Future<List<Target>?> getTargetsByCategory(int categoryId);
  Future<List<Cost>?> getCostsByCategory(int categoryId);
  Future<List<Saving>?> getSavingsByTarget(int targetId);
  Future<int?> getAverageCostByDate();
}

class DatabaseController {
  final IDatabase _implementationObject = UseDatabase();

  Future<bool> addCostToDatabase(Cost cost) async {
    return _implementationObject.addCost(cost);
  }

  Future<bool> addCategoryToDatabase(Category category) async {
    return _implementationObject.addCategory(category);
  }

  Future<bool> addTargetToDatabase(Target target) async {
    return _implementationObject.addTarget(target);
  }

  Future<bool> addSavingToDatabase(Saving saving) async {
    return _implementationObject.addSaving(saving);
  }

  Future<List<Category>?> getCategoriesFromDatabase() async {
    return _implementationObject.getCategories();
  }

  Future<List<Target>?> getTargetsByCategoryFromDatabase(int categoryId) async {
    return _implementationObject.getTargetsByCategory(categoryId);
  }

  Future<List<Cost>?> getCostsByCategoryFromDatabase(int categoryId) async {
    return _implementationObject.getCostsByCategory(categoryId);
  }

  Future<List<Saving>?> getSavingsByTargetFromDatabase(int targetId) async {
    return _implementationObject.getSavingsByTarget(targetId);
  }

  Future<int?> getAverageCostByDate() async {
    return _implementationObject.getAverageCostByDate();
  }
}