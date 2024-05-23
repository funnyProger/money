import 'package:flutter/material.dart';
import 'package:flutter_projects/gui/widgets/info_screen/targets/target_list_item_widget.dart';

import '../costs/cost_list_item_widget.dart';


class TargetsWidget extends StatefulWidget {
  const TargetsWidget({super.key});

  @override
  State<TargetsWidget> createState() => _TargetsWidgetState();
}

class _TargetsWidgetState extends State<TargetsWidget> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.transparent,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(118),
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 4,
                  ),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(100, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(
                          left: 13,
                          top: 10,
                        ),
                        child: const Text(
                          "Здоровье",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 72,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(
                          left: 13,
                        ),
                        child: const Text(
                          "Общий прогресс: 67%",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(
                          left: 13,
                          bottom: 10,
                        ),
                        child: const Text(
                          "Число целей: 4",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
          itemCount: 14,
          itemBuilder: (context, index) {
            return const TargetListItemWidget();
          },
        ),
      ),
    );
  }
}
