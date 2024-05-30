import 'package:flutter/cupertino.dart';
import '../entities/category.dart';
import '../entities/cost.dart';
import '../entities/target.dart';
import '../entities/saving.dart';
import '../database/database_controller.dart';

class DatabaseModel extends ChangeNotifier {
  final DatabaseController _databaseController = DatabaseController();
  List<Category> _categories = [];

  Future<bool> addCost(Cost cost) async {
    bool result = await _databaseController.addCostToDatabase(cost);
    if (result) {
      await updateCategories();
      return result;
    } else {
      return false;
    }
  }

  Future<bool> addCategory(Category category) async {
    bool result = await _databaseController.addCategoryToDatabase(category);
    if (result) {
      await updateCategories();
      return result;
    } else {
      return false;
    }
  }

  Future<bool> addTarget(Target target) async {
    bool result = await _databaseController.addTargetToDatabase(target);
    if (result) {
      await updateCategories();
      return result;
    } else {
      return false;
    }
  }

  Future<bool> addSaving(Saving saving) async {
    bool result = await _databaseController.addSavingToDatabase(saving);
    if (result) {
      await updateCategories();
      return result;
    } else {
      return false;
    }
  }


  Future<void> updateCategories() async {
    try {
      _categories = await _databaseController.getCategoriesFromDatabase() ?? [];
      notifyListeners();
    } catch (ex) {
      debugPrint(ex.toString());}
  }

  List<Category> get categories => [..._categories];
}
