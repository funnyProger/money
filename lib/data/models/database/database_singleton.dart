import '../../database/database_controller.dart';
import '../../entities/category.dart';

class DatabaseSingleton {
  DatabaseSingleton._();
  static final DatabaseSingleton _instance = DatabaseSingleton._();
  static DatabaseController controller = DatabaseController();
  static List<Category> _categories = [];

  static DatabaseSingleton get databaseSingleton => _instance;

  static getCategories() async {
    try {
      List<Category>? result = await controller.getCategoriesFromDatabase();
      print("Обновился список всех категорий: $result");
      if (result != null) {
        _categories = result;
      } else {
        _categories = [];
      }
    } catch (ex) {
      _categories = [];
    }
  }

  List<Category> get categories => [..._categories];

  Future<bool> add(Category category) async {
    _categories.add(category);
    bool result = await controller.addCategoryToDatabase(category);
    return result;
  }
}