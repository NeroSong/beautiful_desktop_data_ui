import 'package:beautiful_desktop_data_ui/common/config.dart';
import 'package:beautiful_desktop_data_ui/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var curIndex = 0;
  final secondTextColor = Color.fromARGB(255, 218, 217, 217);
  final menuLsName = [
    'Dashboard',
    'Charts',
    'Table',
    'Bank',
  ];
  final menuLsIcons = [
    Icons.dashboard,
    Icons.pie_chart,
    Icons.table_chart,
    Icons.account_balance
  ];
  final mainCtrl = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            leftPanel(),
            Expanded(child: mainArea()),
          ],
        ));
  }

  leftPanel() => Container(
        width: 180,
        color: Color(0xff333657),
        child: Stack(
          children: [
            DragToMoveArea(child: Container()),
            Column(
              children: [
                SizedBox(height: 30),
                Text(
                  'Beautiful Data',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.fromLTRB(10, 6, 6, 6),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 70, 74, 121),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: Offset(.5, .8),
                    //   )
                    // ]
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Product One',
                        style: TextStyle(
                            fontSize: 12,
                            color: secondTextColor,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: secondTextColor,
                        size: 16,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(child: menus()),
                Container(
                  height: 70,
                  margin: EdgeInsets.symmetric(horizontal: Config.padding4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(Config.padding1 + 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color.fromARGB(255, 80, 85, 138),
                            ),
                            child: Icon(
                              Icons.settings,
                              size: 15,
                              color: secondTextColor,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Config.padding2,
                                vertical: Config.padding1),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 70, 74, 121),
                              // boxShadow: [
                              //   BoxShadow(
                              //     offset: Offset(.5, .8),
                              //   )
                              // ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.power_settings_new,
                                  color: Colors.red,
                                  size: 12,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Exit',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: secondTextColor,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );

  menus() => Column(
        children: [
          for (var i in Iterable.generate(menuLsName.length))
            mMenuItem(menuLsIcons[i], menuLsName[i], i)
        ],
      );

  mMenuItem(IconData icon, String name, int index) => GestureDetector(
        onTap: () {
          setState(() {
            curIndex = index;
          });
          mainCtrl.jumpToPage(index);
        },
        child: Container(
          height: 38,
          margin: EdgeInsets.only(
            left: 10,
            bottom: 5,
          ),
          padding: EdgeInsets.only(
            left: 20,
          ),
          decoration: BoxDecoration(
            color: index == curIndex ? Color.fromARGB(255, 90, 94, 148) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: index == curIndex ? Colors.white : secondTextColor,
                size: 18,
              ),
              SizedBox(width: 10),
              Text(
                name,
                style: TextStyle(
                    fontSize: 14,
                    color: index == curIndex ? Colors.white : secondTextColor,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none),
              ),
              Spacer(),
              if (index == curIndex)
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  width: 8,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 74, 77, 124),
                      borderRadius: BorderRadius.circular(8)),
                ),
              SizedBox(
                width: 4,
              )
            ],
          ),
        ),
      );

  mainArea() => Container(
        color: Color.fromARGB(255, 74, 77, 124),
        child: PageView(
          controller: mainCtrl,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          children: [
            DashBoardPage(),
            ...menuLsName
                .map((e) => Container(
                      child: Center(
                        child: Text(
                          e,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ))
                .skip(1)
                .toList()
          ],
        ),
      );
}
