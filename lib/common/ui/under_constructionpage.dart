import 'package:flutter/material.dart';
import 'package:mobile_pdam/views/dashboard/dashboard_view.dart';
import 'package:one_context/one_context.dart';

class UnderConstructiopage extends StatefulWidget {
  const UnderConstructiopage({Key key}) : super(key: key);

  @override
  _UnderConstructiopageState createState() => _UnderConstructiopageState();
}

class _UnderConstructiopageState extends State<UnderConstructiopage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  OnePlatform.reboot(
                    setUp: () {
                      OneContext().key = GlobalKey<NavigatorState>();
                    },
                    builder: () => DashBoardView(),
                  );
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ))
          ],
        ),
        body: Center(
          child: Container(
            child: Image.asset('asset/image/icon_maintenance.png'),
          ),
        ),
      ),
    );
  }
}
