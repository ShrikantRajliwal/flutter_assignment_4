import 'package:flutter/material.dart';
import 'package:flutter_assignment_4/providers/data_provider.dart';
import 'package:flutter_assignment_4/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => DataProvider())],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Color(0xFF252525)),
        home: HomeScreen(),
      ),
    );
  }
}
