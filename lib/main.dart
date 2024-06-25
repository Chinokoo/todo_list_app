import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list_app/pages/home.dart';

void main() async {
  //init the hive
  await Hive.initFlutter();

  //open the box
  // ignore: unused_local_variable
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TODO LIST APP',
        theme: ThemeData(primarySwatch: Colors.yellow),
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}
