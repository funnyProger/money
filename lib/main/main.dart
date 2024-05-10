import 'package:flutter/material.dart';

import '../gui/widgets/main_screen_widgets/add_forms_widgets/add_form_container_widget.dart';
import '../gui/widgets/main_screen_widgets/main_screen_widget.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'main': (context) => const MainScreenWidget(),
        'add_form': (context) => const AddFormContainerWidget(),
      },
      home: const MainScreenWidget()
    );
  }
}


