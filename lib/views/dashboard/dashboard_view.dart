import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:mobile_pdam/common/ui/app_colors.dart';
import 'package:mobile_pdam/views/profile/profile_view.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({ Key key }) : super(key: key);

  @override
  _DashBoardViewState createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {

  var selectedFood = 'Baca Meter';

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
                height: 400.0,
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
                  blendMode: BlendMode.dstIn,),
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
                  top: 200.0,
                  left: 40.0,
                  child: Column(
                    children: <Widget>[
                      Text('PDAM',
                          style: TextStyle(
                              fontFamily: 'Sofia',
                              fontSize: 32.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54))
                    ],
                  )),
              Positioned(
                  top: 235.0,
                  left: 40.0,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('MOBILE',
                              style: TextStyle(
                                  fontFamily: 'Sofia',
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor)),
                          Text(',',
                              style: TextStyle(
                                  fontFamily: 'Sofia',
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(width: 10.0),
                        ],
                      )
                    ],
                  )),
              Positioned(
                  top: 320.0,
                  left: 25.0,
                  right: 25.0,
                  child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                color: Colors.black12.withOpacity(0.03),
                                spreadRadius: 10.0)
                          ],
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0))),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Lets explore some food here...',
                            hintStyle: TextStyle(
                                color: Colors.black38,
                                fontFamily: 'Sofia',
                                fontSize: 12.0),
                            contentPadding: EdgeInsets.only(top: 15.0),
                            prefixIcon: Icon(Icons.search, color: Colors.grey)),
                      ))),
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 15.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white),
                    child: Center(
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
              ),
            ],
          ),
          //Get out of the stack for the options
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _menuItem('Baca Meter', Icons.mp_outlined),
            _menuItem('Penertiban', Icons.policy_outlined),
            _menuItem('Pembayaran', Icons.payment_outlined),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _menuItem('Gis', Icons.map_outlined),
              _menuItem('Lainya', Icons.apps),
              _menuItem('Lain', Icons.apps),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem(String menu, icon){
    return InkWell(
       splashColor: Colors.transparent,
       onTap: (){
         pilihmenu(menu);
       },
       child: AnimatedContainer(
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 300),
            height: selectedFood == menu ? 100.0 : 75.0,
            width: selectedFood == menu ? 100.0 : 75.0,
            color: selectedFood == menu
                ? AppColors.primaryColor
                : Colors.transparent,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                icon,
                color: selectedFood == menu ? Colors.white : Colors.grey,
                size: 25.0,
              ),
              SizedBox(height: 12.0),
              Text(menu,
                  style: TextStyle(
                      fontFamily: 'Sofia',
                      color:
                          selectedFood == menu ? Colors.white : Colors.grey,
                      fontSize: 10.0))
            ]))
    );
  }
  pilihmenu(String menu) {
    setState(() {
      selectedFood = menu;
    });
  }
}