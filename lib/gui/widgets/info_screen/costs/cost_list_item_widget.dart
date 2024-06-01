import 'package:flutter/material.dart';

import '../../../../data/entities/cost.dart';
import 'info/cost_info_wiget.dart';

class CostListItemWidget extends StatelessWidget {
  const CostListItemWidget({
    super.key,
    required this.cost,
    required this.categoryName,
  });

  final Cost cost;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 8, top: 3, right: 8, bottom: 3),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CostInfoWidget(
                cost: cost,
                categoryName: categoryName,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(100, 0, 0, 0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    cost.description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    "${cost.price} ₽",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
