import 'package:flutter/material.dart';
import '../gui/widgets/info_screen/costs/info/cost_info_wiget.dart';
import '../gui/widgets/info_screen/info_widget.dart';
import '../gui/widgets/info_screen/targets/info/savings_statistics/savings_statistics_widget.dart';
import '../gui/widgets/info_screen/targets/info/target_info_widget.dart';
import '../gui/widgets/main_screen/add/add_widget.dart';
import '../gui/widgets/main_screen/add/saving/add_saving_form_widget.dart';
import '../gui/widgets/main_screen/main_widget.dart';


void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        'main': (context) => const MainWidget(),
        'add_form': (context) => const AddWidget(),
        "add_saving_form": (context) => const AddSavingFormWidget(),
        'info_screen': (context) => const InfoWidget(),
        "cost_info_screen": (context) => const CostInfoWidget(),
        "target_info_screen": (context) => const TargetInfoWidget(),
        "savings_statistics_screen": (context) => const SavingsStatisticsWidget(),
      },
      home: const MainWidget()
    );
  }
}


