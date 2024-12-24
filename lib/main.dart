import 'package:flutter/material.dart';

import 'Clculator_Screen.dart';

main (){
runApp(ClaculatorApp());
}
class ClaculatorApp extends StatelessWidget {
  const ClaculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      routes: {
        ClculatorScreen.RouteName:(context)=>ClculatorScreen(),
      },
      initialRoute: ClculatorScreen.RouteName,
    );
  }
}
