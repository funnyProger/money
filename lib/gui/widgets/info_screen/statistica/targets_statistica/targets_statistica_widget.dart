import 'package:flutter/material.dart';
import 'package:flutter_projects/data/entities/target.dart';
import 'package:flutter_projects/gui/widgets/main_screen/add/saving/add_saving_list_item_widget.dart';


class TargetsStatisticaWidget extends StatelessWidget {
  const TargetsStatisticaWidget({
    super.key,
    required this.targets,
  });
  final List<Target> targets;

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
              "Статистика целей:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
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
                              "Всего целей: ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "${targets.length}",
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
                            "Общее накопление: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "${targets.fold(0, (previousValue, element) => previousValue + getSavingsSum(element))} / ${targets.fold(0, (previousValue, element) => previousValue + element.price.toInt())} руб.",
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(right: 5),
                          child: const Text(
                            "Общий процент продвижения: ",
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
                            "${targets.fold(0, (previousValue, element) => previousValue + (element.progress * 100).toInt())~/(targets.length)}%",
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
                            "Средний размер накопления: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "${targets.fold(0, (previousValue, target) => previousValue + getSavingsSum(target)) ~/ targets.fold(0, (previousValue, target) => previousValue + target.savings.length)} руб.",
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
                            "День достижения всех целей: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            targets.reduce((value, element) => DateTime.parse(value.lastDate).compareTo(DateTime.parse(element.lastDate)) > 0 ? value : element).lastDate.substring(0, 10),
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
