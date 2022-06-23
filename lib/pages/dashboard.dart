import 'package:beautiful_desktop_data_ui/common/config.dart';
import 'package:beautiful_desktop_data_ui/widgets/c_line_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Config.padding3),
      child: Column(
        children: [
          miniInfoRow(),
          lineChartArea(),
        ],
      ),
    );
  }

  miniInfoRow() => Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Row(
          children: [
            // SizedBox(width: 15),
            MiniInfoCard('User Online', '337,236', Icons.people,
                Color.fromARGB(255, 167, 130, 237)),
            MiniInfoCard(
                'Profit Today', '1,200.00', Icons.paid, Colors.orange[400]!),
            MiniInfoCard('Order Total', '32,321', Icons.sticky_note_2,
                Color.fromARGB(255, 113, 234, 236)),
            MiniInfoCard('Service Available', '99.98 %', Icons.public,
                Color.fromARGB(255, 107, 224, 125)),
          ],
        ),
      );

  MiniInfoCard(
    String name,
    String amount,
    IconData icon,
    Color color,
  ) =>
      Expanded(
        child: Card(
          color: Color.fromARGB(255, 98, 101, 151),
          margin: EdgeInsets.all(Config.padding1),
          child: Container(
            height: 80,
            child: Row(
              children: [
                SizedBox(
                  width: 60,
                  child: Center(
                    child: Icon(
                      icon,
                      size: 28,
                      color: color,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70),
                      ),
                      SizedBox(height: 5),
                      Text(
                        amount,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

  lineChartArea() => Expanded(
        child: Card(
          // 统一风格，不用圆角
          // shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(Config.padding1),
          color: Color.fromARGB(255, 98, 101, 151),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Config.padding4, vertical: Config.padding2),
            child: CLineChart(),
          ),
        ),
      );
}
