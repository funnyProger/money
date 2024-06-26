import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/gui/widgets/main_screen/add/saving/add_saving_widget.dart';
import 'package:flutter_projects/gui/widgets/main_screen/add/target/add_target_widget.dart';
import 'package:provider/provider.dart';
import '../../../../data/models/database/database_model.dart';
import 'category/add_category_widget.dart';
import 'cost/add_cost_widget.dart';

class AddWidget extends StatefulWidget {
  const AddWidget({
    super.key,
    required this.tabIndex,
  });
  final int tabIndex;

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.index = widget.tabIndex;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: const Color.fromARGB(255, 30, 30, 30),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: SegmentedTabControl(
                  height: 43.0,
                  controller: _tabController,
                  tabTextColor: Colors.white38,
                  selectedTabTextColor: Colors.white,
                  indicatorPadding: const EdgeInsets.all(4),
                  squeezeIntensity: 0,
                  splashColor: Colors.transparent,
                  splashHighlightColor: Colors.transparent,
                  indicatorDecoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius:
                      BorderRadius.all(Radius.circular(50))),
                  barDecoration: const BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(50))),
                  tabs: const [
                    SegmentTab(
                      label: "Покупка",
                      backgroundColor: Color.fromARGB(100, 0, 0, 0),
                    ),
                    SegmentTab(
                      label: "Категория",
                      backgroundColor: Color.fromARGB(100, 0, 0, 0),
                    ),
                    SegmentTab(
                      label: "Цель",
                      backgroundColor: Color.fromARGB(100, 0, 0, 0),
                    ),
                    SegmentTab(
                      label: "Сбережение",
                      backgroundColor: Color.fromARGB(100, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ),
            body: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const NeverScrollableScrollPhysics(),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      context.watch<DatabaseModel>().categories.isEmpty ? const Center(
                        child: Text(
                          "Добавьте категорию",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          )
                        ),
                      ) :
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: const SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                          child: AddCostWidget(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: const SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                          child: AddCategoryWidget(),
                        ),
                      ),
                      context.watch<DatabaseModel>().categories.isEmpty ? const Center(
                        child: Text(
                          "Добавьте категорию",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          )
                        ),
                      ) :
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: const SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                          child: AddTargetWidget(),
                        ),
                      ),
                      context.watch<DatabaseModel>().categories.isEmpty ? const Center(
                        child: Text(
                          "Добавьте категорию",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          )
                        ),
                      ) :
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: const AddSavingWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 16, bottom: 16),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).clearSnackBars();
              },
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          )
        ],
      )
    );
  }
}