import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TargetListItemWidget extends StatelessWidget {
  const TargetListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 8, top: 5, right: 8, bottom: 5),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            "cost_info_screen",
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
                            child: const Text(
                                "Купить компьютер",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 8),
                            child: const Text(
                                "Прошло дней: 82 дн.",
                                style: TextStyle(
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
                      flex: 3,
                      child: Container(
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.only(right: 8),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
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
                              "30000" " ₽",
                              style: TextStyle(
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
                  value: 0.5,
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
