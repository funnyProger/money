import 'package:flutter/material.dart';
import 'package:flutter_projects/gui/widgets/main_screen/add/saving/add_saving_list_item_widget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../../../data/models/database_model.dart';
import '../../grid/grid_item_widget.dart';

class AddSavingWidget extends StatefulWidget {
  const AddSavingWidget({super.key});

  @override
  State<AddSavingWidget> createState() => _AddSavingWidgetState();
}

class _AddSavingWidgetState extends State<AddSavingWidget> {
  int? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(100, 0, 0, 0),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 3, top: 3, bottom: 7),
                      child: GradientText(
                        "Выберите категорию:",
                        colors: const [
                          Colors.red,
                          Colors.orange,
                          Colors.yellow,
                          Colors.green,
                          Colors.blue,
                          Colors.indigo,
                          Colors.purple,
                        ],
                      )
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                        scrollDirection: Axis.horizontal,
                        itemCount: context.watch<DatabaseModel>().categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedCategory = index;
                              });
                              FocusScope.of(context).unfocus();
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: (_selectedCategory == index || _selectedCategory == null)
                                    ? HexColor(context.watch<DatabaseModel>().categories[index].color)
                                    : HexColor(context.watch<DatabaseModel>().categories[index].color).withOpacity(0.3),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                border: Border.all(
                                  color: _selectedCategory == index ? Colors.white : Colors.transparent,
                                  width: 3,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 30,
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 5, right: 7),
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        context.watch<DatabaseModel>().categories[index].name,
                                        style: TextStyle(
                                          color: (_selectedCategory == index || _selectedCategory == null)
                                              ? getTextColorByBackgroundColor(context.watch<DatabaseModel>().categories[index].color)
                                              : getTextColorByBackgroundColor(context.watch<DatabaseModel>().categories[index].color).withOpacity(0.6),
                                          fontSize: 20,
                                        ),
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 7, right: 7),
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        "Потрачено: 11843 руб.",
                                        style: TextStyle(
                                          color: (_selectedCategory == index || _selectedCategory == null)
                                              ? getTextColorByBackgroundColor(context.watch<DatabaseModel>().categories[index].color)
                                              : getTextColorByBackgroundColor(context.watch<DatabaseModel>().categories[index].color).withOpacity(0.6),
                                          fontSize: 10,
                                        ),
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 7, right: 7),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Доля от ограничения: 27%",
                                        style: TextStyle(
                                          color: (_selectedCategory == index || _selectedCategory == null)
                                              ? getTextColorByBackgroundColor(context.watch<DatabaseModel>().categories[index].color)
                                              : getTextColorByBackgroundColor(context.watch<DatabaseModel>().categories[index].color).withOpacity(0.6),
                                          fontSize: 10,
                                        ),
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 8);
                        },
                      ),
                    ),
                  )
                ],
              )
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 5),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(100, 0, 0, 0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
              ),
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 5),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: _selectedCategory == null ?
                    const Center(
                      child: Text(
                        "Добавьте цель",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        softWrap: true,
                      ),
                    ) :
                    context.watch<DatabaseModel>().categories[_selectedCategory!].targets.isEmpty ?
                    const Center(
                      child: Text(
                        "Пусто",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        softWrap: true,
                      ),
                    ) :
                    ListView.builder(
                      itemCount: context.watch<DatabaseModel>().categories[_selectedCategory!].targets.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index == context.watch<DatabaseModel>().categories[_selectedCategory!].targets.length - 1) {
                          return Column(
                            children: [
                              AddSavingListItemWidget(target: context.read<DatabaseModel>().categories[_selectedCategory!].targets[index]),
                              const SizedBox(height: 88),
                            ],
                          );
                        } else {
                          return AddSavingListItemWidget(target: context.read<DatabaseModel>().categories[_selectedCategory!].targets[index]);
                        }
                      },
                    ),
                  )
              ),
            ),
          )
        ]
    );
  }
}