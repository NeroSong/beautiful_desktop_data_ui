import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CBarChart extends StatelessWidget {
  const CBarChart({Key? key}) : super(key: key);

  final Color dark = const Color(0xff3b8c75);
  final Color light = const Color(0xff73e8c9);

  @override
  Widget build(BuildContext context) {
    return BarChart(barChartData());
  }

  BarChartData barChartData() => BarChartData(
        // alignment: BarChartAlignment.center,
        barTouchData: BarTouchData(
          enabled: true,
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              getTitlesWidget: bottomTitles,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: leftTitles,
            ),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Colors.white54,
            strokeWidth: 1,
          ),
          drawVerticalLine: false,
        ),
        borderData: FlBorderData(
            show: true,
            border: Border(bottom: BorderSide(color: Colors.white54))),
        barGroups: getData(),
      );

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Apr';
        break;
      case 1:
        text = 'May';
        break;
      case 2:
        text = 'Jun';
        break;
      case 3:
        text = 'Jul';
        break;
      case 4:
        text = 'Aug';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }

  List<BarChartGroupData> getData() {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              width: 20,
              toY: 17000,
              rodStackItems: [
                BarChartRodStackItem(0, 8000, dark),
                BarChartRodStackItem(8000, 17000, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              width: 20,
              toY: 24000,
              rodStackItems: [
                BarChartRodStackItem(0, 14000, dark),
                BarChartRodStackItem(14000, 24000, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              width: 20,
              toY: 23000.5,
              rodStackItems: [
                BarChartRodStackItem(0, 18000, dark),
                BarChartRodStackItem(18000, 23000.5, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              width: 20,
              toY: 23731,
              rodStackItems: [
                BarChartRodStackItem(0, 12340, dark),
                BarChartRodStackItem(12340, 23731, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              width: 20,
              toY: 31000,
              rodStackItems: [
                BarChartRodStackItem(0, 11000, dark),
                BarChartRodStackItem(11000, 31000, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              width: 20,
              toY: 35000,
              rodStackItems: [
                BarChartRodStackItem(0, 24000, dark),
                BarChartRodStackItem(24000, 35000, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              width: 20,
              toY: 27000,
              rodStackItems: [
                BarChartRodStackItem(0, 11000, dark),
                BarChartRodStackItem(11000, 27000, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              width: 20,
              toY: 18000,
              rodStackItems: [
                BarChartRodStackItem(0, 14000, dark),
                BarChartRodStackItem(14000, 18000, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              width: 20,
              toY: 20000,
              rodStackItems: [
                BarChartRodStackItem(0, 12000, dark),
                BarChartRodStackItem(12000, 20000, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
    ];
  }
}
