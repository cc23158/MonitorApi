import 'package:flutter/material.dart';
import "insert.dart";

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      title: "Monitor Management",
      home: MonitorSchedule(),
    );
  }
}