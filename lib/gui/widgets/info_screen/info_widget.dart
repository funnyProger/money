import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/gui/widgets/info_screen/statistica/statistica_widget.dart';
import 'package:flutter_projects/gui/widgets/info_screen/targets/targets_widget.dart';
import '../../../data/entities/category.dart';
import 'costs/costs_widget.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  State<InfoWidget> createState() {
    return _InfoWidgetState();
  }
}

class _InfoWidgetState extends State<InfoWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Scaffold(
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
                      label: "Покупки",
                      backgroundColor: Color.fromARGB(100, 0, 0, 0),
                    ),
                    SegmentTab(
                      label: "Цели",
                      backgroundColor: Color.fromARGB(100, 0, 0, 0),
                    ),
                    SegmentTab(
                      label: "Статистика",
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
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    CostsWidget(category: widget.category),
                    TargetsWidget(category: widget.category),
                    StatisticaWidget(category: widget.category),
                  ],
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
      ),
    );
  }
}