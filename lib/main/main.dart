import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/models/database/database_model.dart';
import '../data/models/database/database_singleton.dart';
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
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        'main': (context) => const MainWidget(),
        "target_info_screen": (context) => const TargetInfoWidget(),
        "savings_statistics_screen": (context) => const SavingsStatisticsWidget(),
      },
      home: const MainWidget()
    );
  }
}

Future<void> initDatabase() async {
  await DatabaseSingleton.getCategories();
}


