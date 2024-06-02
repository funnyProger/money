import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../data/entities/cost.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({
    super.key,
    required this.costs,
  });
  final List<Cost> costs;

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      zoomPanBehavior: ZoomPanBehavior(
        enablePinching: true,
        enablePanning: true,
      ),
      primaryXAxis: const DateTimeAxis(
        interval: 0.5,
        isVisible: true,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      primaryYAxis: const NumericAxis(
        isVisible: true,
        interval: 400,
        labelStyle: TextStyle(
          color: Colors.white,
        ),

      ),
      plotAreaBackgroundColor: Colors.transparent,
      plotAreaBorderColor: Colors.transparent,
      borderColor: Colors.transparent,
      palette: const [
        Colors.white
      ],
      series: [
        LineSeries(
          dataSource: [
            for (Cost cost in widget.costs)
              {
                "x": DateTime.parse(cost.createdAt),
                "y": cost.price
              }
          ],
          xValueMapper: (data, int index) {
            return data["x"];
          },
          yValueMapper: (data, int index) {
            return data["y"];
          },
        )
      ],
      trackballBehavior: TrackballBehavior(
          enable: true,
          markerSettings: const TrackballMarkerSettings(
              color: Colors.blue,
              height: 10,
              width: 10
          ),
          lineType: TrackballLineType.vertical,
          activationMode: ActivationMode.singleTap,
          tooltipSettings: const InteractiveTooltip(
              enable: true
          )
      ),
      crosshairBehavior: CrosshairBehavior(
          enable: true,
          lineType: CrosshairLineType.both,
          activationMode: ActivationMode.doubleTap,
          lineColor: Colors.blue,
          lineWidth: 2
      ),
    );
  }

}

Map<DateTime, int> getCostsSumByDay(List<Cost> costs) {
  List<DateTime> dates = costs.map((cost) => DateTime.parse(cost.createdAt.substring(0, 10))).toSet().toList();
  
  Map<DateTime, int> data = {};
  int costByDate = 0;

  for (int i = 0; i < dates.length; i++) {
    for (int j = 0; j < costs.length; j++) {
      if (costs[j].createdAt.substring(0, 10) == dates[i].toString().substring(0, 10)) {
        costByDate += costs[j].price;
      }
    }
    data[dates[i]] = costByDate;
    costByDate = 0;
  }

  print(data);

  return data;
}
