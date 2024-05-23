import 'package:flutter/material.dart';

class CostListItemWidget extends StatelessWidget {
  const CostListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 8, top: 5, right: 8, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue
        ),
      ),
    );
  }
}
