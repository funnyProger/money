import 'package:flutter/material.dart';
import 'package:flutter_projects/data/entities/category.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../data/models/database_model.dart';
import '../../../../data/entities/cost.dart';

class CircularChartWidget extends StatelessWidget {
  const CircularChartWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return SfCircularChart(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      series: [
        DoughnutSeries<Category, String> (
          dataSource: [
            ...context.watch<DatabaseModel>().categories.where((element) => element.costs.isNotEmpty)
          ],
          xValueMapper: (Category category, _) => category.name,
          yValueMapper: (Category category, _) {
            int result = 0;
            for (Cost cost in category.costs) {
              result += cost.price;
            }
            return result;
          },
          dataLabelSettings: const DataLabelSettings(
              isVisible: true
          ),
          pointColorMapper: (Category category, _) => HexColor(category.color),
        )
      ],
    );
  }

}