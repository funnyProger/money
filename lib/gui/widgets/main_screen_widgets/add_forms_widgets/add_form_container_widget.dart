import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'add_cost_form_widgets/add_cost_form_widget.dart';

class AddFormContainerWidget extends StatefulWidget {
  const AddFormContainerWidget({super.key});

  @override
  State<AddFormContainerWidget> createState() => _AddFormContainerWidgetState();
}

class _AddFormContainerWidgetState extends State<AddFormContainerWidget>
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
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        floatingActionButton: FloatingActionButton(
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
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                Container(
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
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      AddCostFormWidget(
                        categories: _dataArguments["categories"],
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.only(top: 10),
                        child: const Text(
                          "Категории",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.only(top: 10),
                        child: const Text(
                          "Цели",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}