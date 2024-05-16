import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'category/add_category_widget.dart';
import 'cost/add_cost_widget.dart';

class AddWidget extends StatefulWidget {
  const AddWidget({super.key});

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late Map<String, dynamic> _dataArguments;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _dataArguments = (
        ModalRoute.of(context)!.settings.arguments ?? <String, dynamic>{
          "categories": [],
        }
    ) as Map<String, dynamic>;

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
                      SingleChildScrollView(
                        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                        child: AddCostWidget(
                          categories: _dataArguments["categories"],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: SingleChildScrollView(
                            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                            child: AddCategoryWidget(
                              categories: _dataArguments["categories"],
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                        child: Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.only(top: 10),
                          child: const Text(
                            "Цели",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
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