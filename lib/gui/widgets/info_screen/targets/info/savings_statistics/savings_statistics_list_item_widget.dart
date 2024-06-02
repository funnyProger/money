import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../../../../../data/entities/saving.dart';


class SavingStatisticsListItemWidget extends StatelessWidget {
  const SavingStatisticsListItemWidget({
    super.key,
    required this.saving,
  });
  final Saving saving;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              saving.createAt.substring(0, 10),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(
                left: 5,
                top: 10,
                right: 5,
              ),
              child: const DottedLine(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 2.0,
                dashColor: Colors.white,
              ),
            )
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              "${saving.price} ₽",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }
}
