import 'package:flutter/material.dart';


class TargetsStatisticaWidget extends StatelessWidget {
  const TargetsStatisticaWidget({super.key});

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
                            child: const Text(
                              "13",
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
                            "Сумма всех целей: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            "151340 руб.",
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
                            "Процент целей: ",
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
                            "83%",
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
                            "Средний размер накопления: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            "1400 руб.",
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
                            "День достижения всех целей: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            "15.12.2022",
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
