import 'package:flutter/material.dart';
import 'package:flutter_projects/gui/widgets/info_screen/targets/info/savings_statistics/savings_statistics_list_item_widget.dart';

import '../../../../../../data/entities/saving.dart';


class SavingsStatisticsWidget extends StatelessWidget {
  const SavingsStatisticsWidget({
    super.key,
    required this.savings,
  });
  final List<Saving> savings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: savings.isEmpty ? Container(
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
            const Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Добавьте накопления",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            )
          ],
        ),
      ) : Container(
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
                    for (int i = 0; i < savings.length; i++)
                      SavingStatisticsListItemWidget(saving: savings[i]),
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
