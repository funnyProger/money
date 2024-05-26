import 'package:flutter/material.dart';
import '../../../main_screen/chart/line_chart_widget.dart';

class CostsStatisticaWidget extends StatelessWidget {
  const CostsStatisticaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 7,
        top: 13,
        right: 12,
        bottom: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(100, 0, 0, 0),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 5),
            child: const Text(
              "Статистика покупок:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          const LineChartWidget(),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 10, top: 7, bottom: 7),
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Colors.white,
                      width: 0.6,
                    ),
                  )
              ),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 11, top: 7),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 5),
                            child: const Text(
                              "Общие застраты: ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              "43822 руб.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 11, top: 8),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(right: 5),
                          child: const Text(
                            "Средний стоимость покупки: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            "891 руб.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 11, top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(right: 5),
                          child: const Text(
                            "Самая большая покупка: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            softWrap: true,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            "736 руб.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 11, top: 8),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(right: 5),
                          child: const Text(
                            "Всего покупок: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            "42",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 11, top: 8, bottom: 5),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(right: 5),
                          child: const Text(
                            "Самый расходный день недели: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            "Вторник",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
