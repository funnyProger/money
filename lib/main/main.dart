import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/database/database_methods.dart';
import '../data/models/database_model.dart';
import '../gui/widgets/info_screen/costs/info/cost_info_wiget.dart';
import '../gui/widgets/info_screen/info_widget.dart';
import '../gui/widgets/info_screen/targets/info/savings_statistics/savings_statistics_widget.dart';
import '../gui/widgets/info_screen/targets/info/target_info_widget.dart';
import '../gui/widgets/main_screen/main_widget.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDatabase();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => DatabaseModel()),
      ],
      child: const Application(),
    )
  );
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}



class _ApplicationState extends State<Application> {

  @override
  void initState() {
    super.initState();
    context.read<DatabaseModel>().updateCategories();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        'main': (context) => const MainWidget(),
        'info_screen': (context) => const InfoWidget(),
        "cost_info_screen": (context) => const CostInfoWidget(),
        "target_info_screen": (context) => const TargetInfoWidget(),
        "savings_statistics_screen": (context) => const SavingsStatisticsWidget(),
      },
      home: const MainWidget()
    );
  }
}

Future<void> initDatabase() async {
  await UseDatabase.initDatabase();
}


