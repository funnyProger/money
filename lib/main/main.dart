import 'package:flutter/material.dart';

import '../gui/widgets/main_screen/add/add_widget.dart';
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
      },
      home: const MainWidget()
    );
  }
}


