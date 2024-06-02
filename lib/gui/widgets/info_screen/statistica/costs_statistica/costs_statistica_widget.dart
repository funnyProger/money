import 'package:flutter/material.dart';
import 'package:flutter_projects/gui/widgets/main_screen/grid/grid_item_widget.dart';
import 'package:provider/provider.dart';
import '../../../../../data/entities/cost.dart';
import '../../../../../data/models/database/database_model.dart';
import '../../../main_screen/chart/line_chart_widget.dart';

class CostsStatisticaWidget extends StatelessWidget {
  const CostsStatisticaWidget({
    super.key,
    required this.costs,
  });
  final List<Cost> costs;

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
          LineChartWidget(costs: costs),
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
                            child: Text(
                              "${getCostsSum(costs)} руб.",
                              style: const TextStyle(
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
                          child: FutureBuilder(
                            future: context.watch<DatabaseModel>().getAverageDaysCost(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  "${snapshot.data} руб.",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                );
                              } else {
                                return const Text(
                                  "0 руб.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                );
                              }
                            },
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
                          child: Text(
                            "${costs.map((e) => e.price).toList().reduce((value, element) => value > element ? value : element)} руб.",
                            style: const TextStyle(
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
                          child: Text(
                            "${costs.length}",
                            style: const TextStyle(
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
                          child: Text(
                            getCorrectDayName(getCostsSumByDay(costs).entries.reduce((valueAndKey, entry) => entry.value > valueAndKey.value ? entry : valueAndKey).key),
                            style: const TextStyle(
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

String getCorrectDayName(DateTime date) {


  switch (date.weekday) {
    case 1:
      return "Понедельник";
    case 2:
      return "Вторник";
    case 3:
      return "Среда";
    case 4:
      return "Четверг";
    case 5:
      return "Пятница";
    case 6:
      return "Суббота";
    case 7:
      return "Воскресенье";
    default:
      return "";
  }
}
