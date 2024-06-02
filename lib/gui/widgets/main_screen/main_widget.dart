import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/data/entities/category.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:provider/provider.dart';
import '../../../data/models/database/database_model.dart';
import 'add/add_widget.dart';
import 'chart/circular_chart_widget.dart';
import 'grid/grid_item_widget.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {

  @override
  Widget build(BuildContext context) {
    List<Category> categories = context.watch<DatabaseModel>().categories;

    if (categories.isEmpty) {
      return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddWidget(tabIndex: categories.isEmpty ? 1 : 0),
                  )
              );
            },
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          body: const Center(
            child: Text(
              "Добавьте категорию",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              )
            ),
          ),
        ),
      );
    } else {
      return SafeArea(
        child: PieCanvas(
          theme: const PieTheme(
            brightness: Brightness.dark,
          ),
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddWidget(tabIndex: categories.isEmpty ? 1 : 0),
                    )
                );
              },
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            body: checkCosts(categories) ? DraggableHome(
              backgroundColor: Colors.black,
              appBarColor: Colors.black,
              title: Container(
                decoration: const BoxDecoration(color: Colors.black),
                child: const Text(
                  "Заголовок",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              headerExpandedHeight: 0.28,
              headerWidget: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        padding: const EdgeInsets.only(left: 15, top: 45),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 15,
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "Расходы:",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 70,
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "${getAllCostsSum(categories)} ₽",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 40,
                                child: getAllTargets(categories) == 0 ? Container() : Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Всего целей: ${getAllTargets(categories)}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                    softWrap: true,
                                  ),
                                )
                            ),
                            Expanded(
                                flex: 15,
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Всего категорий: ${categories.length}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                    softWrap: true,
                                  ),
                                )
                            ),
                            Expanded(
                              flex: 50,
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: FutureBuilder<int?>(
                                  future: context.watch<DatabaseModel>().getAverageDaysCost(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data == 0) {
                                        return Container();
                                      } else {
                                        return Text(
                                          "Средние расходы за день: ${snapshot.data} ₽",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                          softWrap: true,
                                        );
                                      }
                                    } else {
                                      return Container();
                                    }
                                  }
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 10,
                      child: CircularChartWidget(),
                    ),
                  ],
                ),
              ),
              body: [
                GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 5, right: 5, bottom: 93),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: categories.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GridItemWidget(
                      category: categories[index],
                    );
                  },
                ),
              ],
            ) : Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Colors.white,
                          width: 0.6,
                        ),
                      )
                  ),
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 20,
                    right: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  padding: const EdgeInsets.only(
                      left: 8,
                      top: 2,
                      bottom: 3
                  ),
                  child: const Text(
                    "Добавьте хотя бы одну покупку, чтобы появилась статистика категорий...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    softWrap: true,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 1,
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 93),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: categories.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GridItemWidget(
                        category: categories[index],
                      );
                    },
                  ),
                )
              ],
            )
          ),
        ),
      );
    }
  }
}

bool checkCosts(List<Category> categories) {
  for (var category in categories) {
    if (category.costs.isNotEmpty) {
      return true;
    }
  }
  return false;
}

int getAllCostsSum(List<Category> categories) {
  int sum = 0;
  for (var category in categories) {
    for (var cost in category.costs) {
      sum += cost.price;
    }
  }
  return sum;
}

int getAllTargets(List<Category> categories) {
  int count = 0;
  for (var category in categories) {
    count += category.targets.length;
  }
  return count;
}