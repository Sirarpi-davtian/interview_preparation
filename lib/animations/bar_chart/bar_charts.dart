import 'package:flutter/material.dart';
import 'package:interview_questions/animations/bar_chart/chart_column.dart';
import 'package:interview_questions/animations/bar_chart/chart_column2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: BarCharts());
  }
}

class BarCharts extends StatelessWidget {
  const BarCharts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              ChartColumn(),
              SizedBox(
                height: 20,
              ),
              ChartColumn2(),
            ],
          ),
        ),
      ),
    );
  }
}
