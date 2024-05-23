import 'package:flutter/material.dart';

import 'cost_list_item_widget.dart';

class CostsWidget extends StatefulWidget {
  const CostsWidget({super.key});

  @override
  State<CostsWidget> createState() => _CostsWidgetState();
}

class _CostsWidgetState extends State<CostsWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(118),
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 4,
                  ),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(100, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(
                          left: 13,
                          top: 10,
                        ),
                        child: const Text(
                          "Здоровье",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(
                          left: 13,
                        ),
                        child: const Text(
                          "Число покупок: 5",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(
                          left: 13,
                        ),
                        child: const Text(
                          "Потрачено за все время: 42856 ₽",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(
                          left: 13,
                          bottom: 10,
                        ),
                        child: const Text(
                          "Средняя стоимость покупки: 1399 ₽",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
          itemCount: 14,
          itemBuilder: (context, index) {
            if (index == 13) {
              return const SizedBox(
                height: 88,
              );
            } else if (index % 3 == 0 || index % 5 == 0 && index != 0) {
              return Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      height: 35,
                      width: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        DateTime.now().subtract(Duration(days: index)).day.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const CostListItemWidget()
                ],
              );
            } else {
              return const CostListItemWidget();
            }
          },
        ),
      ),
    );
  }
}
