import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';

class TargetInfoWidget extends StatefulWidget {
  const TargetInfoWidget({super.key});

  @override
  State<TargetInfoWidget> createState() => _TargetInfoWidgetState();
}

class _TargetInfoWidgetState extends State<TargetInfoWidget> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);


  @override
  void dispose() {
    super.dispose();
    _valueNotifier.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 43),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 10,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: const Text(
                      "Купить компьютер",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.white,
              thickness: 0.75,
              indent: 10,
              endIndent: 10,
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 11, top: 20, right: 11),
                        child: CircularSeekBar(
                          width: double.infinity,
                          interactive: false,
                          height: 300,
                          progress: 67,
                          barWidth: 8,
                          startAngle: 45,
                          sweepAngle: 270,
                          strokeCap: StrokeCap.butt,
                          progressGradientColors: const [
                            Colors.red,
                            Colors.orange,
                            Colors.yellow,
                            Colors.green,
                            Colors.blue,
                            Colors.indigo,
                            Colors.purple
                          ],
                          innerThumbRadius: 5,
                          innerThumbStrokeWidth: 3,
                          innerThumbColor: Colors.white,
                          outerThumbRadius: 5,
                          outerThumbStrokeWidth: 10,
                          outerThumbColor: Colors.blueAccent,
                          dashWidth: 1,
                          dashGap: 2,
                          animation: true,
                          valueNotifier: _valueNotifier,
                          child: Center(
                            child: ValueListenableBuilder(
                                valueListenable: _valueNotifier,
                                builder: (_, double value, __) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${value.round()} %',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        )
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 10, right: 10),
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
                                      "Накоплено: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: const Text(
                                      "43822 / 50000 руб.",
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
                                      "Нужный размер накопления: ",
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
                                      "Накоплений добавлено: ",
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
                              padding: const EdgeInsets.only(left: 11, top: 8),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(right: 5),
                                    child: const Text(
                                      "Период: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: const Text(
                                      "82 / 123 дн.",
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
                                      "Даты: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: const Text(
                                      "1.01.2024  -  31.12.2024",
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
                                      "Приоритет: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: const Text(
                                      "7",
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
                              padding: const EdgeInsets.only(left: 11, top: 8, bottom: 9),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(right: 5),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Navigator.pushNamed(
                                            context,
                                            "savings_statistics_screen",
                                          );
                                        });
                                      },
                                      child: const Text(
                                        "Посмотреть статискику накоплений",
                                        style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 15,
                                        ),
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 20,
                        right: 10,
                        bottom: 5,
                      ),
                      child: const Text(
                        "Описание:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      child: const Text(
                        "Я хотел накопить на компьютер для того, чтобы играть, но"
                        "у меня понка что мало возможностей, чтобы это сделать."
                        "Пока что я могу добавлять лишь по 80% от нужного размера"
                        "накопления, поэтому думаю мне понадобится больше времениб"
                        "чтобы собрать нужные деньги. Меня это не особо тревожит,"
                        "потому что даже если так, к моменту, когда я соберу нужные"
                        "деньги, все комплектующие подешевеют еще и возможно даже"
                        "у меня постанется немного.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
