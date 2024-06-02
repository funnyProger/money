import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/gui/widgets/info_screen/targets/info/savings_statistics/savings_statistics_widget.dart';
import 'package:flutter_projects/gui/widgets/main_screen/add/saving/add_saving_list_item_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../data/entities/target.dart';
import '../../../../../data/models/database/database_model.dart';

class TargetInfoWidget extends StatefulWidget {
  const TargetInfoWidget({
    super.key,
    required this.target,
  });
  final Target target;

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
                    child: Text(
                      widget.target.name,
                      style: const TextStyle(
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
                          progress: widget.target.progress * 100,
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
                                    child: Text(
                                      "${getSavingsSum(widget.target).toInt()} / ${widget.target.price.toInt()} руб.",
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
                                      "Средний размер накопления: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  FutureBuilder(
                                    future: context.watch<DatabaseModel>().getAverageDaysSaving(widget.target.id),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "${snapshot.data} руб.",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          alignment: Alignment.centerRight,
                                          child: const Text(
                                            "0 руб.",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),
                                        );
                                      }
                                    }
                                  )
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
                                      "Необходимый размер накопления: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                      softWrap: true,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: FutureBuilder(
                                      future: context.watch<DatabaseModel>().getRequiredSaving(widget.target.id),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(
                                            "${snapshot.data! ~/ DateTime.parse(widget.target.lastDate).difference(DateTime.parse(widget.target.firstDate)).inDays} руб.",
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
                                      }
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
                                      "Всего накоплений: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "${widget.target.savings.length}",
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
                                      "Период: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      getPeriodForTargetInfo(widget.target),
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
                                      "Даты: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "${widget.target.firstDate.substring(0, 10)}  -  ${widget.target.lastDate.substring(0, 10)} (${DateTime.parse(widget.target.lastDate.substring(0, 10)).difference(DateTime.parse(widget.target.firstDate.substring(0, 10))).inDays} дн.)",
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
                                      "Приоритет: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "${widget.target.priority}",
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
                              padding: const EdgeInsets.only(left: 11, top: 8, bottom: 9),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(right: 5),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => SavingsStatisticsWidget(savings: widget.target.savings),
                                            ),
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
                      child: Text(
                        widget.target.description,
                        style: const TextStyle(
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
