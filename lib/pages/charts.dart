import 'package:beautiful_desktop_data_ui/widgets/c_bar_chart.dart';
import 'package:beautiful_desktop_data_ui/widgets/c_line_chart.dart';
import 'package:beautiful_desktop_data_ui/widgets/c_pie_chart.dart';
import 'package:flutter/material.dart';

import '../common/config.dart';

class ChartsPage extends StatefulWidget {
  ChartsPage({Key? key}) : super(key: key);

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(Config.padding3),
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            ChartCard(size, CLineChart()),
            ChartCard(size, CBarChart()),
            ChartCard(size, CPieChart()),
          ],
        ),
      ),
    );
  }

  ChartCard(Size size, Widget child) => Card(
      color: Color.fromARGB(255, 98, 101, 151),
      margin: EdgeInsets.all(Config.padding1),
      child: Container(
        width: (size.width - 180 - 50) / 2,
        height: 200,
        padding: EdgeInsets.all(Config.padding2),
        child: child,
      ));
}
