import 'package:flutter/material.dart';
import 'package:flutter_projects/gui/widgets/info_screen/targets/info/savings_statistics/savings_statistics_list_item_widget.dart';


class SavingsStatisticsWidget extends StatelessWidget {
  const SavingsStatisticsWidget({super.key});

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
                      "Накопления",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.white,
              thickness: 0.75,
              indent: 10,
              endIndent: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    for (
                    int i = 0;
                    i < 30;
                    i++
                    )
                      const SavingStatisticsListItemWidget(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
