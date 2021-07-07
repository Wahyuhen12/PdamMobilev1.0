import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:mobile_pdam/common/ui/app_colors.dart';
import 'package:mobile_pdam/views/RBM/rbm_view.dart';
import 'package:mobile_pdam/views/profile/profile_view.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            elevation: 0.0,
          )),
      body: ListView(
        children: <Widget>[
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
                left: 40.0,
                child: Wrap(
                  children: <Widget>[
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
                    SizedBox(width: 160.0),
                    new Icon(
                      Icons.notifications,
                      color: Colors.black45,
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 160.0,
                  left: 40.0,
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
                  left: 40.0,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Selamat Datang di PDAM Mobile',
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
          //Get out of the stack for the options
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _menuItem('Baca Meter', Icons.map_outlined),
            _menuItem('Penertiban', Icons.policy_outlined),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _menuItem('Pembayaran', Icons.payment_outlined),
            _menuItem('Gis', Icons.map_outlined),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _menuItem('Setting', Icons.settings_outlined),
              _menuItem('Lain', Icons.apps),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem(String menu, icon) {
    return InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          pilihmenu(menu);
          OnePlatform.reboot(
              setUp: () {
                OneContext().key = GlobalKey<NavigatorState>();
              },
              builder: () => RBMView());
        },
        child: AnimatedContainer(
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 300),
            height: selectedMenu == menu ? 110.0 : 110.0,
            width: selectedMenu == menu ? 160.0 : 140.0,
            color: selectedMenu == menu
                ? Colors.blue[50].withOpacity(0.5)
                : Colors.transparent,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                icon,
                color: selectedMenu == menu ? Colors.blue : Colors.black38,
                size: 40.0,
              ),
              SizedBox(height: 12.0),
              Text(menu,
                  style: TextStyle(
                      fontFamily: 'Sofia',
                      color:
                          selectedMenu == menu ? Colors.blue : Colors.black38,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600))
            ])));
  }

  pilihmenu(String menu) {
    setState(() {
      selectedMenu = menu;
    });
  }
}
