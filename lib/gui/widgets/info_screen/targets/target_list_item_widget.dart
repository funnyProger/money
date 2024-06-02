import 'package:flutter/material.dart';
import 'package:flutter_projects/gui/widgets/main_screen/add/saving/add_saving_list_item_widget.dart';

import '../../../../data/entities/target.dart';
import 'info/target_info_widget.dart';

class TargetListItemWidget extends StatelessWidget {
  const TargetListItemWidget({
    super.key,
    required this.target,
  });
  final Target target;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 8, top: 5, right: 8, bottom: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TargetInfoWidget(target: target),
            ),
          );
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(100, 0, 0, 0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                                "Название: ${target.name}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                                getCurrentDateTextForTarget(target),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                                "Прогресс: ${(100 * target.progress).toInt() >= 100 ? 100 : (100 * target.progress).toInt()}%",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1
                            ),
                          ),
                        ],
                      )
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.only(right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Накоплено: ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              "${getSavingsSum(target)}/${target.price.toInt()}₽",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        )
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 8, top: 5, right: 8, bottom: 8),
                child: LinearProgressIndicator(
                  value: target.progress,
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(100),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
