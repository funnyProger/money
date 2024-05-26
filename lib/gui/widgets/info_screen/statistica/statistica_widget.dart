import 'package:flutter/material.dart';
import 'package:flutter_projects/gui/widgets/info_screen/statistica/targets_statistica/targets_statistica_widget.dart';
import 'costs_statistica/costs_statistica_widget.dart';

class StatisticaWidget extends StatefulWidget {
  const StatisticaWidget({super.key});

  @override
  State<StatisticaWidget> createState() => _StatisticaWidgetState();
}

class _StatisticaWidgetState extends State<StatisticaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      alignment: Alignment.topCenter,
      child: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CostsStatisticaWidget(),
            SizedBox(
              height: 10,
            ),
            TargetsStatisticaWidget(),
            SizedBox(
              height: 94,
            ),
          ],
        ),
      )
    );
  }
}
