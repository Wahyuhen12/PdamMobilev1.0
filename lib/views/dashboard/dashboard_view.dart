import 'package:flutter/material.dart';
import 'package:mobile_pdam/common/ui/app_colors.dart';
import 'package:mobile_pdam/views/RBM/rbm_view.dart';
import 'package:mobile_pdam/views/penertiban/penertiban_view.dart';
import 'package:mobile_pdam/views/unit/unit_view.dart';
import 'package:one_context/one_context.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({Key key}) : super(key: key);

  @override
  _DashBoardViewState createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  var selectedMenu = 'Baca Meter';

  @override
  Widget build(BuildContext context) {
    print("reload");
    return MaterialApp(
      navigatorKey: OneContext().navigator.key,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: AppBar(
              elevation: 0.0,
            )),
        body: ListView(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: 300.0,
                ),
                ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white, Colors.transparent])
                        .createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text('Foodie',
                      style: TextStyle(
                          fontSize: 75,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.3),
                          letterSpacing: 10.0)),
                ),
                Positioned(
                  top: 32.0,
                  left: 20.0,
                  child: Wrap(
                    children: <Widget>[
                      Row(
                        children: [
                          Text('PDAM ',
                              style: TextStyle(
                                  fontFamily: 'Sofia',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54)),
                          Text('MOBILE',
                              style: TextStyle(
                                  fontFamily: 'Sofia',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor)),
                        ],
                      ),
                      SizedBox(width: 160.0),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.grey[400],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: new Icon(
                          Icons.notifications,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 160.0,
                    left: 20.0,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('Hello ',
                                style: TextStyle(
                                    fontFamily: 'Sofia',
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                            Text('John',
                                style: TextStyle(
                                    fontFamily: 'Sofia',
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                            SizedBox(width: 10.0),
                          ],
                        ),
                      ],
                    )),
                Positioned(
                    top: 200.0,
                    left: 20.0,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Selamat Datang\nDi PDAM Mobile',
                              style: TextStyle(
                                fontFamily: 'Sofia',
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.black26,
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _menu(
                  'Baca Meter',
                  Icons.speed,
                ),
                _menu('Penertiban', Icons.policy_outlined),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _menu('Pembayaran', Icons.payment_outlined),
                  _menu('Gis', Icons.map_outlined),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _menu('Pasang Baru', Icons.add_location_alt_outlined),
                  _menu('Setting', Icons.settings_outlined),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _menu('Log Out', Icons.logout),
                  _menu('Lainnya', Icons.apps),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menu(String namaMenu, icon) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        pilihmenu(namaMenu);
        selectedMenu == "Baca Meter"
            ? OneContext().push(MaterialPageRoute(builder: (_) => RBMView()))
            : selectedMenu == "Penertiban"
                ? OneContext()
                    .push(MaterialPageRoute(builder: (_) => PenertibanView()))
                //     : selectedMenu == "Pembayaran"
                //         ? OneContext().push(
                //             MaterialPageRoute(builder: (_) => PembayaranView()))
                : selectedMenu == "Gis"
                    ? OneContext()
                        .push(MaterialPageRoute(builder: (_) => UnitView()))
                    // : selectedMenu == "Pasang Baru"
                    //     ? OneContext().push(MaterialPageRoute(
                    //         builder: (_) => PasangBaruView()))
                    //     : selectedMenu == "Setting"
                    //         ? OneContext().push(MaterialPageRoute(
                    //             builder: (_) => UnderConstructiopage()))
                    //         : selectedMenu == "Lainnya"
                    //             ? OneContext().push(MaterialPageRoute(
                    //                 builder: (_) => UnderConstructiopage()))
                    : print("Salah Data");
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: AnimatedContainer(
                decoration: BoxDecoration(
                    color: selectedMenu == namaMenu
                        ? Colors.blue[100].withOpacity(0.5)
                        : Colors.grey[100].withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                curve: Curves.easeIn,
                duration: Duration(milliseconds: 200),
                height: selectedMenu == namaMenu ? 70.0 : 70.0,
                width: selectedMenu == namaMenu ? 140.0 : 140.0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              icon,
                              color: selectedMenu == namaMenu
                                  ? Colors.blue
                                  : Colors.black38,
                              size: 40.0,
                            ),
                            Icon(
                              Icons.fiber_manual_record,
                              size: 10.0,
                              color: selectedMenu == namaMenu
                                  ? Colors.blue
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.0),
                    ])),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 55.0, top: 10.0),
            child: Text(namaMenu,
                style: TextStyle(
                    fontFamily: 'Sofia',
                    color:
                        selectedMenu == namaMenu ? Colors.blue : Colors.black38,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }

  pilihmenu(String menu) {
    setState(() {
      selectedMenu = menu;
    });
  }
}
