import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
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
        color: Colors.black26,
      ),
      child: SfCartesianChart(
        zoomPanBehavior: ZoomPanBehavior(
          enablePinching: true,
          enablePanning: true,
        ),
        primaryXAxis: const DateTimeAxis(
          interval: 1,
          isVisible: true,
          labelStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        primaryYAxis: const NumericAxis(
          isVisible: true,
          interval: 1000,
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
              {"x": DateTime.now().subtract(const Duration(days: 13)), "y": 3221},
              {"x": DateTime.now().subtract(const Duration(days: 12)), "y": 2211},
              {"x": DateTime.now().subtract(const Duration(days: 11)), "y": 7743},
              {"x": DateTime.now().subtract(const Duration(days: 10)), "y": 1002},
              {"x": DateTime.now().subtract(const Duration(days: 9)), "y": 698},
              {"x": DateTime.now().subtract(const Duration(days: 8)), "y": 4825},
              {"x": DateTime.now().subtract(const Duration(days: 7)), "y": 3332},
              {"x": DateTime.now().subtract(const Duration(days: 6)), "y": 1023},
              {"x": DateTime.now().subtract(const Duration(days: 5)), "y": 321},
              {"x": DateTime.now().subtract(const Duration(days: 4)), "y": 1899},
              {"x": DateTime.now().subtract(const Duration(days: 3)), "y": 5300},
              {"x": DateTime.now().subtract(const Duration(days: 2)), "y": 2333},
              {"x": DateTime.now().subtract(const Duration(days: 1)) , "y": 2222},
              {"x": DateTime.now(), "y": 4692},
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
      ),
    );
  }
}