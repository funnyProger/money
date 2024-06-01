import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pie_menu/pie_menu.dart';

import '../../../../data/entities/category.dart';
import '../../../../data/entities/cost.dart';
import '../../info_screen/costs/costs_widget.dart';
import '../../info_screen/info_widget.dart';

class GridItemWidget extends StatelessWidget {
  const GridItemWidget({
    super.key,
    required this.category,
  });

  final Category category;


  @override
  Widget build(BuildContext context) {
    return PieMenu(
      key: ValueKey(category.name),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoWidget(category: category),
          ),
        );
      },
      actions: [
        PieAction(
          onSelect: () {
            // удалить категорию
          },
          tooltip: const Text("Удалить"),
          buttonTheme: const PieButtonTheme(
            backgroundColor: Colors.red,
            iconColor: Colors.white,
          ),
          child: const Icon(
            Icons.remove,
          ),
        )
      ],
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: HexColor(category.color),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              alignment: Alignment.topLeft,
              child: Text(
                category.name,
                style: TextStyle(
                  color: getTextColorByBackgroundColor(category.color),
                  fontSize: 25,
                ),
                softWrap: true,
              ),
            ),
            category.targets.isEmpty ?
            Container() :
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Цели: 3",
                style: TextStyle(
                  color: getTextColorByBackgroundColor(category.color),
                  fontSize: 13,
                ),
                softWrap: true,
              ),
            ),
            category.costs.isEmpty ?
            Container() :
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Покупки: ${category.costs.length}",
                    style: TextStyle(
                      color: getTextColorByBackgroundColor(category.color),
                      fontSize: 13,
                    ),
                    softWrap: true,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Потрачено: ${getCostsSum(category.costs)} руб.",
                    style: TextStyle(
                      color: getTextColorByBackgroundColor(category.color),
                      fontSize: 13,
                    ),
                    softWrap: true,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Средний размер покупки: ${getCostsSum(category.costs)~/category.costs.length} руб.",
                    style: TextStyle(
                      color: getTextColorByBackgroundColor(category.color),
                      fontSize: 13,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

getTextColorByBackgroundColor(String color) {
  return HexColor(color).computeLuminance() > 0.3
      ? Colors.black : Colors.white;
}

int getCostsSum(List<Cost> costs) {
  int costsSum = 0;

  for (Cost cost in costs) {
    costsSum += cost.price;
  }
  return costsSum;
}