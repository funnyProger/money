import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:provider/provider.dart';
import '../../../data/models/database_model.dart';
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

    if (context.watch<DatabaseModel>().categories.isEmpty) {
      return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 30, 30, 30),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddWidget(tabIndex: context.read<DatabaseModel>().categories.isEmpty ? 1 : 0),
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
                    fontSize: 15
                ),
              ),
            )
        ),
      );
    } else {
      return PieCanvas(
        theme: const PieTheme(
          brightness: Brightness.dark,
        ),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddWidget(tabIndex: context.read<DatabaseModel>().categories.isEmpty ? 1 : 0),
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
          body: DraggableHome(
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
                              child: const Text(
                                "42856 ₽",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                ),
                                softWrap: true,
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 40,
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: const Text(
                                  "Уровень расходов: Хороший",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                  softWrap: true,
                                ),
                              )),
                          Expanded(
                            flex: 50,
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: const Text(
                                "Средние расходы за день: 8344 ₽",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                softWrap: true,
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
                padding: const EdgeInsets.only(left: 5, right: 5),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: context.watch<DatabaseModel>().categories.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GridItemWidget(
                    category: context.watch<DatabaseModel>().categories[index],
                  );
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}
