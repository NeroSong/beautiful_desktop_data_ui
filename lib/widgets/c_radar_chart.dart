import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CRadarChart extends StatelessWidget {
  CRadarChart({Key? key}) : super(key: key);

  final gridColor = Color.fromARGB(255, 124, 138, 191);
  final titleColor = Colors.white70;
  final fashionColor = Color(0xffe15665);
  final artColor = Color(0xff63e7e5);
  final boxingColor = Color(0xff83dea7);
  final entertainmentColor = Colors.white70;
  final offRoadColor = Color(0xFFFFF59D);

  @override
  Widget build(BuildContext context) {
    return RadarChart(
      RadarChartData(
        radarTouchData: RadarTouchData(enabled: true),
        dataSets: showingDataSets(),
        radarBackgroundColor: Colors.transparent,
        radarShape: RadarShape.polygon,
        borderData: FlBorderData(show: true),
        radarBorderData: BorderSide(color: gridColor),
        titlePositionPercentageOffset: 0.2,
        titleTextStyle: TextStyle(
          color: titleColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        getTitle: (index, angle) {
          final usedAngle = angle;
          switch (index) {
            case 0:
              return RadarChartTitle(
                text: 'Windows',
                angle: usedAngle,
              );
            case 1:
              return RadarChartTitle(
                text: 'Linux',
                angle: usedAngle,
              );
            case 2:
              return RadarChartTitle(
                text: 'MacOS',
                angle: usedAngle,
              );
            case 3:
              return RadarChartTitle(
                text: 'Android',
                angle: usedAngle,
              );
            case 4:
              return RadarChartTitle(
                text: 'iOS',
                angle: usedAngle,
              );
            default:
              return const RadarChartTitle(text: '');
          }
        },
        tickCount: 3,
        ticksTextStyle:
            const TextStyle(color: Colors.transparent, fontSize: 10),
        tickBorderData: BorderSide(color: gridColor),
        gridBorderData: BorderSide(color: gridColor, width: 2),
      ),
      swapAnimationDuration: const Duration(milliseconds: 400),
    );
  }

  List<RadarDataSet> showingDataSets() {
    return rawDataSets().asMap().entries.map((entry) {
      var rawDataSet = entry.value;

      return RadarDataSet(
        fillColor: rawDataSet.color.withOpacity(0.05),
        borderColor: rawDataSet.color,
        entryRadius: 2,
        dataEntries:
            rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: 2,
      );
    }).toList();
  }

  List<RawDataSet> rawDataSets() {
    return [
      RawDataSet(
        title: 'Fashion',
        color: fashionColor,
        values: [
          300,
          250,
          250,
          120,
          230,
        ],
      ),
      RawDataSet(
        title: 'xxx',
        color: artColor,
        values: [
          250,
          200,
          290,
          200,
          100,
        ],
      ),
      // RawDataSet(
      //   title: 'Entertainment',
      //   color: entertainmentColor,
      //   values: [
      //     200,
      //     150,
      //     50,
      //   ],
      // ),
      // RawDataSet(
      //   title: 'Off-road Vehicle',
      //   color: offRoadColor,
      //   values: [
      //     150,
      //     200,
      //     150,
      //   ],
      // ),
      // RawDataSet(
      //   title: 'Boxing',
      //   color: boxingColor,
      //   values: [
      //     100,
      //     250,
      //     100,
      //   ],
      // ),
    ];
  }
}

class RawDataSet {
  final String title;
  final Color color;
  final List<double> values;

  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });
}
