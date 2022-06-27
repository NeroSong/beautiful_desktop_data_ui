import 'package:beautiful_desktop_data_ui/common/config.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class TablePage extends StatefulWidget {
  TablePage({Key? key}) : super(key: key);

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  final leftColWidth = 70.0;
  final rightTitleLs = ['Status', 'Phone', 'Rank', 'Remark'];
  final rightDataLs = ['Active', '123xxxx4321', 'A', 'Just comments'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final rightColWidth = size.width - leftColWidth - 180 - 40;

    return Container(
      padding: EdgeInsets.all(Config.padding3),
      child: Card(
          color: Color.fromARGB(255, 98, 101, 151),
          margin: EdgeInsets.all(Config.padding1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: SizedBox(
              height: 200,
              child: HorizontalDataTable(
                leftHandSideColumnWidth: leftColWidth,
                rightHandSideColumnWidth: rightColWidth,
                isFixedHeader: true,
                headerWidgets: _getTitleWidget(rightColWidth),
                leftSideItemBuilder: _generateFirstColumnRow,
                rightSideItemBuilder: (_, i) =>
                    _generateRightHandSideColumnRow(_, i, rightColWidth),
                itemCount: 20,
                rowSeparatorWidget: const Divider(
                  color: Colors.black54,
                  height: 1.0,
                  thickness: 0.0,
                ),
                leftHandSideColBackgroundColor:
                    Color.fromARGB(255, 98, 101, 151),
                rightHandSideColBackgroundColor:
                    Color.fromARGB(255, 98, 101, 151),
              ),
            ),
          )),
    );
  }

  List<Widget> _getTitleWidget(double width) {
    return [
      _getTitleItemWidget('ID', leftColWidth),
      ...rightTitleLs.map((e) => _getTitleItemWidget(e, width / 4)).toList(),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 48,
      color: Color.fromARGB(255, 102, 105, 162),
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      child: Text(label,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      width: leftColWidth,
      height: 48,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      child: Text(
        'No.$index',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _generateRightHandSideColumnRow(
      BuildContext context, int index, double width) {
    return Row(
      children: <Widget>[
        // Container(
        //   width: width / 4,
        //   height: 52,
        //   padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        //   alignment: Alignment.centerLeft,
        //   child: Row(
        //     children: <Widget>[
        //       Icon(
        //         Icons.safety_check,
        //         color: Colors.green,
        //         size: 18,
        //       ),
        //       Text(
        //         'Active',
        //         style: TextStyle(
        //           color: Colors.white,
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        ...rightDataLs
            .map(
              (e) => Container(
                width: width / 4,
                height: 48,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
                child: Text(
                  e + index.toString(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
