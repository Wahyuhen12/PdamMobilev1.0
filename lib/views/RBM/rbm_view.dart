import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mobile_pdam/common/ui/app_icon_belum_baca.dart';
import 'package:mobile_pdam/common/ui/app_icon_sudah_baca.dart';
import 'package:mobile_pdam/common/ui/app_presentase_hold.dart';
import 'package:mobile_pdam/common/ui/app_presentase_none.dart';
import 'package:mobile_pdam/common/ui/app_succesDialog.dart';
import 'package:mobile_pdam/views/RBM/rbm_detail.dart';
import 'package:mobile_pdam/views/dashboard/dashboard_view.dart';
import 'package:one_context/one_context.dart';

class RBMView extends StatefulWidget {
  const RBMView({Key key}) : super(key: key);

  @override
  _RBMViewState createState() => _RBMViewState();
}

class _RBMViewState extends State<RBMView> {

  List namameter = [
    {'nama': "0398DUMMY", 'tgl': 'Today', 'status':'done'},
    {'nama': "0365DUMMY", 'tgl': 'Today', 'status':'none'},
    {'nama': "0594DUMMY", 'tgl': 'Today', 'status':'hold'},
    {'nama': "0198DUMMY", 'tgl': 'YesterDay', 'status':'hold'},
    {'nama': "0165DUMMY", 'tgl': 'YesterDay', 'status':'none'},
    {'nama': "0294DUMMY", 'tgl': '07-06-2021', 'status':'done'},
    {'nama': "0265DUMMY", 'tgl': '06-06-2021', 'status':'done'},
  ];

  @override
  void initState() {
    super.initState();
    print("reload");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        builder: OneContext().builder,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Text('Daftar Baca Meter ',
                  style: TextStyle(
                      fontFamily: 'Sofia',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                    ),
              actions: [
                IconButton(
                  onPressed: (){
                   OnePlatform.reboot(
                    setUp: () {
                      OneContext().key = GlobalKey<NavigatorState>();
                    },
                    builder: () => DashBoardView(),
                  );
                  }, 
                  icon: Icon(Icons.close, color: Colors.black,)
                )
              ],
            ),
            body: Column(
              children: [
                new Container(
                    height: 50.0,
                    width: 340.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0))),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: Colors.black38,
                              fontFamily: 'Sofia',
                              fontSize: 12.0),
                          contentPadding: EdgeInsets.only(top: 15.0),
                          prefixIcon: Icon(Icons.search, color: Colors.grey)),
                    )),
                new Expanded(
                  child: Container(
                    color: Colors.white,
                    child: GroupedListView<dynamic, String>(
                      elements: namameter,
                      groupBy: (element) => element['tgl'],
                      groupComparator: (value1, value2) =>
                          value2.compareTo(value1),
                      itemComparator: (item1, item2) =>
                          item1['nama'].compareTo(item2['nama']),
                      order: GroupedListOrder.ASC,
                      groupSeparatorBuilder: (String value) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 115.0),
                                child: Text(value,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Icon(
                                  Icons.clear_all_outlined,
                                ),
                              ),
                            ],
                          )),
                      itemBuilder: (c, element) {
                        return InkWell(
                          onTap: () {
                            OnePlatform.reboot(
                                setUp: () {
                                  OneContext().key =
                                      GlobalKey<NavigatorState>();
                                },
                                builder: () => RbmDetail(
                                      nomorMeter: element['nama'],
                                    ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey[400],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            margin: new EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 6.0),
                            child: Container(
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                //leading: Icon(Icons.account_circle),
                                leading: element['status'] == 'hold' ? AppPresentaseHold() : element['status'] == 'done' ? AppIconSudahBaca() : AppPresentaseNone(),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      element['nama'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Total Pelanggan 10"),
                                  ],
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 17.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            )));
  }
}

