import 'package:flutter/material.dart';

class CostListItemWidget extends StatelessWidget {
  const CostListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
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
          child: Row(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 8),
                  child: const Text(
                    "Лекарства в аптеке, которые мне нужны, чтобы вылечиться",
                    style: TextStyle(
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
                  child: const Text(
                    "852" " ₽",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
