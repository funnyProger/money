import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../entities/category.dart';
import '../entities/cost.dart';
import '../entities/saving.dart';
import '../entities/target.dart';
import 'database_controller.dart';
import 'database_scripts.dart';

class UseDatabase implements IDatabase {
  Database? _database;


  Future<Database> get database async {
    if(_database != null) {
      return _database!;
    } else {
      _database = await initDatabase();
      return _database!;
    }
  }

  static Future<Database?> initDatabase() async {
    try {
      Database database = await openDatabase(
        join(await getDatabasesPath(), 'cent.db'),
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(DatabaseScripts.createCategoryTable);
          await db.execute(DatabaseScripts.createTargetTable);
          await db.execute(DatabaseScripts.createCostTable);
          await db.execute(DatabaseScripts.createSavingTable);
        },
      );
      return database;
    } catch (ex) {
      return null;
    }
  }

  @override
  Future<bool> addCost(Cost cost) async {
    try {
      final db = await database;
      await db.insert(
        "cost",
        cost.toDbJson(),
        conflictAlgorithm: ConflictAlgorithm.replace
      );
      return true;
    } catch (ex) {
      return false;
    }
  }

  @override
  Future<bool> addCategory(Category category) async {
    try {
      final db = await database;
      await db.insert(
          "category",
          category.toDbJson(),
          conflictAlgorithm: ConflictAlgorithm.fail
      );
      return true;
    } catch (ex) {
      return false;
    }
  }

  @override
  Future<bool> addTarget(Target target) async {
    try {
      final db = await database;
      await db.insert(
          "target",
          target.toDbJson(),
          conflictAlgorithm: ConflictAlgorithm.fail
      );
      return true;
    } catch (ex) {
      return false;
    }
  }

  @override
  Future<bool> addSaving(Saving saving) async {
    try {
      final db = await database;
      await db.transaction((txn) async {
        await txn.rawInsert('insert into saving (created_at, price, target_id) values (?, ?, ?)', [saving.createAt, saving.price, saving.targetId]);
        await txn.rawUpdate('update target set progress = (select sum(price) from saving where target_id = ?) / (select price from target where id = ?) where id = ?', [saving.targetId, saving.targetId, saving.targetId]);
      });
      return true;
    } catch (ex) {
      return false;
    }
  }

  @override
  Future<List<Category>?> getCategories() async {
    try {
      final db = await database;
      const getCategoriesQuery = "select * from category";

      List<Category> categories = (
          await db.rawQuery(getCategoriesQuery)).map((item) => Category.fromDbJson(item)
      ).toList();

      for (Category category in categories) {
        category.targets = await getTargetsByCategory(category.id) ?? [];
        category.costs = await getCostsByCategory(category.id) ?? [];

        for (Target target in category.targets) {
          target.savings = await getSavingsByTarget(target.id) ?? [];
        }
      }

      return categories;
    } catch (ex) {
      return null;
    }
  }


  @override
  Future<List<Target>?> getTargetsByCategory(int categoryId) async {
    try {
      final db = await database;
      const getTargetsQuery = "select * from target where category_id = ?";
      List<Target> targets = (
          await db.rawQuery(getTargetsQuery, [categoryId])).map((item) => Target.fromDbJson(item)
      ).toList();
      return targets;
    } catch (ex) {
      return null;
    }
  }

  @override
  Future<List<Cost>?> getCostsByCategory(int categoryId) async {
    try {
      final db = await database;
      const getCostsQuery = "select * from cost where category_id = ?";
      List<Cost> costs = (
          await db.rawQuery(getCostsQuery, [categoryId])).map((item) => Cost.fromDbJson(item)
      ).toList();
      return costs;
    } catch (ex) {
      return null;
    }
  }

  @override
  Future<List<Saving>?> getSavingsByTarget(int targetId) async {
    try {
      final db = await database;
      const getSavingsQuery = "select * from saving where target_id = ?";
      List<Saving> savings = (
          await db.rawQuery(getSavingsQuery, [targetId])).map((item) => Saving.fromDbJson(item)
      ).toList();
      return savings;
    } catch (ex) {
      return null;
    }
  }

  @override
  Future<int?> getAverageDaysCost() async {
    try {
      final db = await database;
      const getAverageCostQuery = "select avg(price) from cost";
      double result = (await db.rawQuery(getAverageCostQuery))[0]["avg(price)"] as double;
      return result.toInt();
    } catch (ex) {
      return null;
    }
  }

  @override
  Future<int?> getAverageDaysSaving(int targetId) async {
    try {
      final db = await database;
      String getAverageSavingQuery = "select avg(price) from saving where target_id = $targetId";
      double result = (await db.rawQuery(getAverageSavingQuery))[0]["avg(price)"] as double;
      return result.toInt();
    } catch (ex) {
      return null;
    }
  }

  @override
  Future<int?> getRequiredSaving(int targetId) async {
    try {
      final db = await database;
      String getSavingByPriorityQuery = "select ((select sum(price) from target) / (select sum(priority) from target)"
          "* (select priority from target where id = $targetId)) as result";
      double result = (await db.rawQuery(getSavingByPriorityQuery))[0]["result"] as double;
      return result.toInt();
    } catch (ex) {
      return null;
    }
  }
}