import 'package:flutter/material.dart';
import 'package:flutter_projects/data/entities/category.dart';
import 'package:flutter_projects/data/entities/chart_entities/circular_chart_data.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularChartWidget extends StatelessWidget {
  const CircularChartWidget({
    super.key,
    required this.categories
  });
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      series: [
        DoughnutSeries<Category, String> (
          dataSource: [
            ...categories
          ],

          xValueMapper: (Category category, _) => category.name,
          yValueMapper: (Category category, _) => category.cost,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true
          ),
          pointColorMapper: (Category category, _) => HexColor(category.color!),
        )
      ],
    );
  }

}