import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:mobile_pdam/common/ui/app_colors.dart';
import 'package:mobile_pdam/views/RBM/rbm_view.dart';
import 'package:mobile_pdam/views/dashboard/dashboard_view.dart';
import 'package:mobile_pdam/views/profile/profile_view.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({ Key key }) : super(key: key);

  @override
  _NavigatorBarState createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
 
  int halaman = 0;

  Widget callPage(int current){
    switch (current){
      case 0:
        return new DashBoardView();
      case 1:
        return new ProfileView();
        case 2:
        return new RBMView();
      default :
        return DashBoardView(); 
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callPage(halaman),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.black38.withOpacity(0.15)))),
        child: BottomNavyBar(
          selectedIndex: halaman,
          onItemSelected: (index) {
            setState(() => halaman = index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: Text('Home'),
                icon: Icon(Icons.home),
                activeColor: AppColors.primaryColor,
                inactiveColor: Colors.black38),
            BottomNavyBarItem(
                title: Text('Akun'),
                icon: Icon(Icons.person),
                activeColor: AppColors.primaryColor,
                inactiveColor: Colors.black38),
          ],
        ),
      ),
    );
  }
}