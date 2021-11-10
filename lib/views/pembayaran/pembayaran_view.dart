import 'package:flutter/material.dart';
import 'package:mobile_pdam/common/ui/under_constructionpage.dart';
import 'package:mobile_pdam/views/dashboard/dashboard_view.dart';
import 'package:one_context/one_context.dart';

class PembayaranView extends StatefulWidget {
  const PembayaranView({Key key}) : super(key: key);

  @override
  _PembayaranViewState createState() => _PembayaranViewState();
}

class _PembayaranViewState extends State<PembayaranView> {
  var _pilihmenu;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                OnePlatform.reboot(
                  setUp: () {
                    OneContext().key = GlobalKey<NavigatorState>();
                  },
                  builder: () => DashBoardView(),
                );
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              _menuPembayaran("Bayar"),
              _menuPembayaran("Cetak"),
              _menuPembayaran("Test"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuPembayaran(String menu) {
    return InkWell(
      onTap: () {
        OneContext()
            .push(MaterialPageRoute(builder: (_) => UnderConstructiopage()));
      },
      child: Container(
        child: Card(
          child: ListTile(
            title: Text(
              menu,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  pilihmenu(String namamenu) {
    setState(() {
      _pilihmenu = namamenu;
    });
  }
}
