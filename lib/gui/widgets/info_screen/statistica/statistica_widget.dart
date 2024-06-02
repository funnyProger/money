import 'package:flutter/material.dart';
import 'package:flutter_projects/gui/widgets/info_screen/statistica/targets_statistica/targets_statistica_widget.dart';
import '../../../../data/entities/category.dart';
import 'costs_statistica/costs_statistica_widget.dart';

class StatisticaWidget extends StatefulWidget {
  const StatisticaWidget({
    super.key,
    required this.category,
  });
  final Category category;

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
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            widget.category.costs.isEmpty ? Container() :
            Column(
              children: [
                CostsStatisticaWidget(costs: widget.category.costs),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            widget.category.targets.isEmpty ? Container() :
            Column(
              children: [
                TargetsStatisticaWidget(targets: widget.category.targets),
                const SizedBox(
                  height: 93,
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
