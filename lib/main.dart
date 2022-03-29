import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/Screens/taskapp.dart';
import 'package:task_app/providers/task_list_provider.dart';

import 'Theme/theme.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TaskList())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const TaskApp(),
      },
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
    );
  }
}
