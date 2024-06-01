import 'package:flutter/material.dart';
import 'package:flutter_projects/gui/widgets/main_screen/grid/grid_item_widget.dart';
import '../../../../data/entities/category.dart';
import 'cost_list_item_widget.dart';

class CostsWidget extends StatefulWidget {
  const CostsWidget({
    super.key,
    required this.category,
  });
  final Category category;

  @override
  State<CostsWidget> createState() => _CostsWidgetState();
}

class _CostsWidgetState extends State<CostsWidget> {


  @override
  Widget build(BuildContext context) {
    late DateTime date;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: widget.category.costs.isEmpty ? const Center(
        child: Text(
          "Добавьте покупку",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
      ) :
      NestedScrollView(
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
                        height: 50,
                      ),
                      widget.category.costs.isEmpty ? Container() :
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(
                          left: 13,
                        ),
                        child: Text(
                          "Число покупок: ${widget.category.costs.length}",
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
                        ),
                        child: Text(
                          "Потрачено за все время: ${getCostsSum(widget.category.costs)} ₽",
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
                          "Средняя стоимость покупки: ${getCostsSum(widget.category.costs) ~/ widget.category.costs.length} ₽",
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
          itemCount: widget.category.costs.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            date = DateTime.parse(widget.category.costs[index].createdAt);
            if (index == widget.category.costs.length) {
              return const SizedBox(
                height: 88,
              );
            } else {
              if (DateTime.parse(widget.category.costs[index].createdAt).day != date.day) {
                date = DateTime.parse(widget.category.costs[index].createdAt);
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        height: 35,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          date.day.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    CostListItemWidget(
                      cost: widget.category.costs[index],
                      categoryName: widget.category.name,
                    ),
                  ],
                );
              } else {
                return CostListItemWidget(
                  cost: widget.category.costs[index],
                  categoryName: widget.category.name,
                );
              }
            }
          },
        ),
      )
    );
  }
}
