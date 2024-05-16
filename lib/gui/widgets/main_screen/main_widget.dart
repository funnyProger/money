import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:pie_menu/pie_menu.dart';
import '../../../data/entities/category.dart';
import 'chart/circular_chart_widget.dart';
import 'grid/grid_item_widget.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {

  final List<Category> _categories = [
    Category(
      name: "Одежда",
      description: "Расходы, которые идут на одежду",
      color: "FF6666",
      cost: 10000,
      status: 0,
      targets: null,
      costs: null,
    ),
    Category(
      name: "Косметика",
      description: "Расходы, которые идут на косметику",
      color: "#33CCCC",
      cost: 7000,
      status: 0,
      targets: null,
      costs: null,
    ),
    Category(
      name: "Дом",
      description: "Расходы, которые идут на дом",
      color: "#9933CC",
      cost: 12000,
      status: 0,
      targets: null,
      costs: null,
    ),
    Category(
      name: "Развлечения",
      description: "Расходы, которые идут на развлечения",
      color: "#FF9933",
      cost: 6000,
      status: 0,
      targets: null,
      costs: null,
    ),
    Category(
      name: "Здоровье",
      description: "Расходы, которые идут на здоровье",
      color: "#99CC00",
      cost: 3000,
      status: 0,
      targets: null,
      costs: null,
    )
  ];


  @override
  Widget build(BuildContext context) {
    return PieCanvas(
      theme: const PieTheme(
        brightness: Brightness.dark,
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              'add_form',
              arguments: {
                'categories': _categories
              },
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
                Expanded(
                  flex: 10,
                  child: CircularChartWidget(
                    categories: _categories,
                  ),
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
              itemCount: _categories.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GridItemWidget(
                  category: _categories[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
