import 'package:flutter/material.dart';

class TargetsWidget extends StatefulWidget {
  const TargetsWidget({super.key});

  @override
  State<TargetsWidget> createState() => _TargetsWidgetState();
}

class _TargetsWidgetState extends State<TargetsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
    );
  }
}
