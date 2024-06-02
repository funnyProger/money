import 'package:flutter/material.dart';
import 'package:flutter_projects/gui/widgets/info_screen/targets/target_list_item_widget.dart';

import '../../../../data/entities/category.dart';
import '../../../../data/entities/target.dart';


class TargetsWidget extends StatefulWidget {
  const TargetsWidget({
    super.key,
    required this.category
  });
  final Category category;

  @override
  State<TargetsWidget> createState() => _TargetsWidgetState();
}

class _TargetsWidgetState extends State<TargetsWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: widget.category.targets.isEmpty ? const Center(
        child: Text(
          "Добавьте цель",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
      ) : NestedScrollView(
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
                        child: Text(
                          widget.category.name,
                          style: const TextStyle(
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
                        child: Text(
                          "Число целей: ${widget.category.targets.length}",
                          style: const TextStyle(
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
                        child: Text(
                          "Общий прогресс: ${(getTargetsProgress(widget.category.targets) * 100).toInt()}%",
                          style: const TextStyle(
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
          itemCount: widget.category.targets.length + 1,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == widget.category.targets.length) {
              return const SizedBox(
                height: 88,
              );
            } else {
              return TargetListItemWidget(target: widget.category.targets[index]);
            }
          },
        ),
      ),
    );
  }
}

double getTargetsProgress(List<Target> targets) {
  if (targets.isEmpty) {
    return 0;
  } else {
    return targets
        .map((target) => target.progress)
        .reduce((value, element) => value + element) / targets.length;
  }
}
