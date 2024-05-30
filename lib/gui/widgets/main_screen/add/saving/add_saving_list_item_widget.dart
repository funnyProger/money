import 'package:flutter/material.dart';
import 'package:flutter_projects/gui/widgets/main_screen/add/saving/add_saving_form_widget.dart';

import '../../../../../data/entities/target.dart';

class AddSavingListItemWidget extends StatelessWidget {
  const AddSavingListItemWidget({
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
        onTap: () async {
          return showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                backgroundColor: Colors.black,
                child: AddSavingFormWidget(target: target)
              );
            },
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
                                  target.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                  "Прошло дней: ${DateTime.parse(target.firstDate).day}/${DateTime.parse(target.lastDate).day} дн.",
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
                                  "Прогресс: ${target.progress}%",
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
                      flex: 3,
                      child: Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.only(right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                "${getSum(target)} ₽",
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

int getSum(Target target) {
  int sum = 0;
  for (var saving in target.savings) {
    sum += saving.price;
  }
  return sum;
}
