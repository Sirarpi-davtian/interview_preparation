import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartColumn2 extends StatelessWidget {
  const ChartColumn2({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text(
                  '854',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.arrow_upward,
                  color: Colors.lightBlueAccent,
                ),
                const Text(
                  '25 upward',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                const Expanded(child: SizedBox()),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    size: 40,
                  ),
                ),
              ],
            ),
            const SfCartesianChart(
              plotAreaBackgroundColor: Colors.transparent,
              margin: EdgeInsets.symmetric(vertical: 20),
              borderColor: Colors.transparent,
              borderWidth: 0,
              plotAreaBorderWidth: 0,
              enableSideBySideSeriesPlacement: false,
              primaryXAxis: CategoryAxis(
                isVisible: false,
              ),
              primaryYAxis: NumericAxis(
                isVisible: false,
                minimum: 0,
                maximum: 2,
                interval: 0.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}


class ChartColumnData {
  ChartColumnData(this.x, this.y, this.y1);
  final String x;
  final double y;
  final double y1;
}

final List<ChartColumnData> chartData = <ChartColumnData>[
  ChartColumnData('Mo', 2, 1),
  ChartColumnData('Tu',2, 0.4),
  ChartColumnData('We', 2, 1),
  ChartColumnData('Th', -0.45, 0.7),
  ChartColumnData('Fr', -0.9, 0.8),
  ChartColumnData('Sa', -0.6, 0.9),
  ChartColumnData('Su', -0.5, 1),
];
