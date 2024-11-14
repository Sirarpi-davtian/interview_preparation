import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartColumn extends StatelessWidget {
  const ChartColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Vertical bar',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      'Statistics of the month',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    size: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  width: 27,
                  height: 13,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Data one',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 27,
                  height: 13,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Data two',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SfCartesianChart(
              plotAreaBorderColor: Colors.transparent,
              margin: const EdgeInsets.all(0),
              borderColor: Colors.transparent,
              borderWidth: 0,
              plotAreaBorderWidth: 0,
              enableSideBySideSeriesPlacement: false,
              primaryXAxis: const CategoryAxis(
                axisLine: AxisLine(
                  width: 0.5,
                ),
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: MajorTickLines(width: 0),
                crossesAt: 0,
              ),
              primaryYAxis: const NumericAxis(
                isVisible: false,
                minimum: -1,
                maximum: 2,
                interval: 0.5,
              ),
              series: <CartesianSeries>[
                ColumnSeries<ChartColumnData, String>(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  width: 0.5,
                  color: Colors.pinkAccent,
                  dataSource: chartData,
                  xValueMapper: (ChartColumnData data, _) => data.x,
                  yValueMapper: (ChartColumnData data, _) => data.y,
                ),
                ColumnSeries<ChartColumnData, String>(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  dataSource: chartData,
                  width: 0.5,
                  color: Colors.purple,
                  xValueMapper: (ChartColumnData data, _) => data.x,
                  yValueMapper: (ChartColumnData data, _) => data.y1,
                ),
              ],
            ),
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
  ChartColumnData('Mo', -0.3, 1.7),
  ChartColumnData('Tu', -0.5, 0.4),
  ChartColumnData('We', -0.4, 1),
  ChartColumnData('Th', -0.45, 0.7),
  ChartColumnData('Fr', -0.9, 0.8),
  ChartColumnData('Sa', -0.6, 0.9),
  ChartColumnData('Su', -0.5, 1),
];
