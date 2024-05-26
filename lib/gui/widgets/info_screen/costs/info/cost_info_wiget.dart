import 'package:flutter/material.dart';

class CostInfoWidget extends StatelessWidget {
  const CostInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: const Text(
                      "Здоровье",
                      style: TextStyle(
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
                    child: const Text(
                      "852" " ₽",
                      style: TextStyle(
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
              child: const Text(
                "Купил такое то лекарства в машазие, чтобы вылечиться,"
                "еще купил нужные для тренировок добавки, которые повышают"
                "выносливость мышц, что позволяет тренироваться дольше. "
                "Также купил вкусные протеиновые батончики, которые помогают"
                "во время быстрых перекусов, и по лезно, и внусно.",
                style: TextStyle(
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
