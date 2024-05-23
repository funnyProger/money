import 'package:flutter/material.dart';

class StatisticaWidget extends StatefulWidget {
  const StatisticaWidget({super.key});

  @override
  State<StatisticaWidget> createState() => _StatisticaWidgetState();
}

class _StatisticaWidgetState extends State<StatisticaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
    );
  }
}
