import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main_screen/add/cost/cost_list_item_widget.dart';

class CostsWidget extends StatefulWidget {
  const CostsWidget({super.key});

  @override
  State<CostsWidget> createState() => _CostsWidgetState();
}

class _CostsWidgetState extends State<CostsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: const Color.fromARGB(100, 0, 0, 0),
              borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  left: 18,
                  top: 10,
                ),
                child: const Text(
                  "Здоровье",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  left: 18,
                ),
                child: const Text(
                  "Число покупок: 5",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  left: 18,
                ),
                child: const Text(
                  "Потрачено за все время: 42856 ₽",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  left: 18,
                    bottom: 10,
                ),
                child: const Text(
                  "Средняя стоимость покупки: 1399 ₽",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 5),
          decoration: const BoxDecoration(
            color: Color.fromARGB(100, 0, 0, 0),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )
          ),
          child: Column(
            children: [
              for (int i = 0; i < 5; i++)
                const CostListItemWidget(),
            ],
          ),
        )
      ],
    );
  }
}
