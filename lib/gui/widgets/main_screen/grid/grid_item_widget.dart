import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pie_menu/pie_menu.dart';

import '../../../../data/entities/category.dart';

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
        // открыть подробную информацию по категории
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
          color: HexColor(category.color!),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 30,
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.bottomLeft,
                child: Text(
                  category.name,
                  style: TextStyle(
                    color: getTextColorByBackgroundColor(category.color!),
                    fontSize: 25,
                  ),
                  softWrap: true,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Потрачено: 11843 руб.",
                  style: TextStyle(
                    color: getTextColorByBackgroundColor(category.color!),
                    fontSize: 13,
                  ),
                  softWrap: true,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  "Доля от ограничения: 27%",
                  style: TextStyle(
                    color: getTextColorByBackgroundColor(category.color!),
                    fontSize: 13,
                  ),
                  softWrap: true,
                ),
              ),
            ),
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