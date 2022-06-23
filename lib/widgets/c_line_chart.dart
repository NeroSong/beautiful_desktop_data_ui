import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CLineChart extends StatelessWidget {
  CLineChart({Key? key}) : super(key: key);

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return LineChart(mainData());
  }

  LineChartData mainData() {
    return LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          horizontalInterval: 1,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.white54,
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: bottomTitleWidgets,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: leftTitleWidgets,
              reservedSize: 38,
            ),
          ),
        ),
        borderData: FlBorderData(
            show: true,
            border: Border(bottom: BorderSide(color: Colors.white54))),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 3),
              FlSpot(2.6, 2),
              FlSpot(4.9, 5),
              FlSpot(6.8, 3.1),
              FlSpot(8, 4),
              FlSpot(10, 4),
              FlSpot(11, 5.5),
            ],
            isCurved: true,
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          getTouchedSpotIndicator: (barData, spotIndexes) {
            return spotIndexes
                .map((e) => TouchedSpotIndicatorData(
                    FlLine(
                      color: barData.gradient!.colors[0],
                      strokeWidth: 3,
                    ),
                    FlDotData(
                      getDotPainter: (p0, p1, p2, p3) => FlDotCirclePainter(
                        color: Color.fromARGB(255, 149, 153, 234),
                        radius: 5,
                      ),
                    )))
                .toList();
          },
        ));
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('04-23', style: style);
        break;
      case 4:
        text = const Text('05-02', style: style);
        break;
      case 6:
        text = const Text('05-18', style: style);
        break;
      case 8:
        text = const Text('05-25', style: style);
        break;
      case 10:
        text = const Text('06-09', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
