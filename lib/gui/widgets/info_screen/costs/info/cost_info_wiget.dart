import 'package:flutter/material.dart';

import '../../../../../data/entities/cost.dart';

class CostInfoWidget extends StatelessWidget {
  const CostInfoWidget({
    super.key,
    required this.cost,
    required this.categoryName,
  });

  final Cost cost;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();
          Navigator.pushNamedAndRemoveUntil(
            context,
            'main',
            (Route<dynamic> route) => false,
          );
        },
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
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
                      categoryName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 15, left: 10),
                    child: Text(
                      "${cost.price} ₽",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              color: Colors.white,
              thickness: 0.75,
              indent: 10,
              endIndent: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 11, top: 5, right: 11),
              child: Text(
                cost.description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
