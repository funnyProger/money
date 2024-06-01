import 'package:flutter/cupertino.dart';
import '../../entities/category.dart';
import '../../entities/cost.dart';
import '../../entities/target.dart';
import '../../entities/saving.dart';
import '../../database/database_controller.dart';
import 'database_singleton.dart';

class DatabaseModel extends ChangeNotifier {
  final DatabaseSingleton _databaseSingleton = DatabaseSingleton.databaseSingleton;
  final DatabaseController _databaseController = DatabaseController();

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
    bool result = await _databaseSingleton.add(category);
    if (result) {
      await updateCategories();
      return result;
    } else {
      return result;
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
      await DatabaseSingleton.getCategories();
      notifyListeners();
    } catch (ex) {
      debugPrint(ex.toString());}
  }

  Future<int?> getAverageCostByDate() async {
    try {
      int? result = await _databaseController.getAverageCostByDate();
      return result;
    } catch (ex) {
      return 0;
    }
  }

  List<Category> get categories => _databaseSingleton.categories;
}
