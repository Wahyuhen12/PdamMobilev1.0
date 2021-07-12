import 'package:flutter/material.dart';
import 'package:mobile_pdam/common/ui/app_icon_belum_baca.dart';
import 'package:mobile_pdam/common/ui/app_icon_sudah_baca.dart';
import 'package:flutter/services.dart';
import 'package:mobile_pdam/views/input_catat_meter/input_catat_meter_view.dart';
import 'package:one_context/one_context.dart';

class RbmDetail extends StatefulWidget {
  const RbmDetail({Key key, this.nomorMeter, this.namapel}) : super(key: key);
  final String nomorMeter;
  final RbmDetail namapel;
  @override
  _RbmDetailState createState() => _RbmDetailState();
}

class _RbmDetailState extends State<RbmDetail> {
  var _pilihStatus = 'All';

  List<NamaPelanggan> sudahbaca = [
    NamaPelanggan(
        idpel: 10001, nama: "Poernomo", status: true, tagihan: "A2.2/999DEMO"),
    NamaPelanggan(
        idpel: 10003, nama: "Johan", status: true, tagihan: "A4.2/999DEMO"),
    NamaPelanggan(
        idpel: 10005, nama: "Wahyu", status: true, tagihan: "A6.2/999DEMO"),
  ];

  List<NamaPelanggan> belumbaca = [
    NamaPelanggan(
        idpel: 10002, nama: "Susanto", status: false, tagihan: "A3.2/999DEMO"),
    NamaPelanggan(
        idpel: 10004, nama: "Anton", status: false, tagihan: "A5.2/999DEMO"),
    NamaPelanggan(
        idpel: 10006, nama: "Stark", status: false, tagihan: "A7.2/999DEMO"),
    NamaPelanggan(
        idpel: 10007, nama: "Jonny", status: false, tagihan: "A8.2/999DEMO"),
  ];

  List<NamaPelanggan> namapel = [
    NamaPelanggan(
        idpel: 10001, nama: "Poernomo", status: true, tagihan: "A2.2/999DEMO"),
    NamaPelanggan(
        idpel: 10002, nama: "Susanto", status: false, tagihan: "A3.2/999DEMO"),
    NamaPelanggan(
        idpel: 10003, nama: "Johan", status: true, tagihan: "A4.2/999DEMO"),
    NamaPelanggan(
        idpel: 10004, nama: "Anton", status: false, tagihan: "A5.2/999DEMO"),
    NamaPelanggan(
        idpel: 10005, nama: "Wahyu", status: true, tagihan: "A6.2/999DEMO"),
    NamaPelanggan(
        idpel: 10006, nama: "Stark", status: false, tagihan: "A7.2/999DEMO"),
    NamaPelanggan(
        idpel: 10007, nama: "Jonny", status: false, tagihan: "A8.2/999DEMO"),
  ];

  @override
  void initState(){
    super.initState();
    print(namapel.length);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.blue));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: AppBar(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0)),
            ),
            centerTitle: false,
            backgroundColor: Colors.blue,
            flexibleSpace: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 80, right: 150),
                  child: Text(
                    widget.nomorMeter,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "26%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "Terbaca",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "30%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "Terbaca",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "4%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "Updated",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _statusItem('All'),
                  _statusItem('Terbaca'),
                  _statusItem('Belum Terbaca'),
                ],
              ),
            ),
            _statusPelanggan()
          ]),
        ),
      ),
    );
  }

  Widget _statusPelanggan() {
    return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(children: <Widget>[
          _pilihStatus == "All"
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: namapel.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: InkWell(
                        onTap: () {
                          OnePlatform.reboot(
                              setUp: () {
                                OneContext().key = GlobalKey<NavigatorState>();
                              },
                              builder: () => InputMeterView(
                                    idpel: namapel[index].idpel.toString(),
                                  ));
                          namapel[index].status = !namapel[index].status;
                          setState(() {});
                        },
                        child: SizedBox(
                          height: 95,
                          child: Card(
                            child: ListTile(
                              leading: namapel[index].status
                                  ? AppIconBelumBaca()
                                  : AppIconSudahBaca(),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    namapel[index].idpel.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    namapel[index].nama,
                                    style: TextStyle(
                                      color: Colors.orange,
                                    ),
                                  ),
                                  Text(namapel[index].tagihan),
                                  Text(namapel[index].nama),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : _pilihStatus == "Terbaca"
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: sudahbaca.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: InkWell(
                            onTap: () {
                              OnePlatform.reboot(
                                  setUp: () {
                                    OneContext().key =
                                        GlobalKey<NavigatorState>();
                                  },
                                  builder: () => InputMeterView(
                                        idpel: namapel[index].idpel.toString(),
                                      ));
                              sudahbaca[index].status =
                                  !sudahbaca[index].status;
                              setState(() {});
                            },
                            child: SizedBox(
                              height: 95,
                              child: Card(
                                child: ListTile(
                                  leading: AppIconSudahBaca(),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        sudahbaca[index].idpel.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        sudahbaca[index].nama,
                                        style: TextStyle(
                                          color: Colors.orange,
                                        ),
                                      ),
                                      Text(sudahbaca[index].tagihan),
                                      Text(sudahbaca[index].nama),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                  : _pilihStatus == "Belum Terbaca" ? 
                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: belumbaca.length,
                                    itemBuilder: (context, index) {
                                      return  Container(
                                  child: InkWell(
                                  onTap: () {
                                    OnePlatform.reboot(
                                          setUp: () {
                                            OneContext().key =
                                                GlobalKey<NavigatorState>();
                                          },
                                          builder: () => InputMeterView(idpel: namapel[index].idpel.toString(),));
                                    belumbaca[index].status = !belumbaca[index].status;
                                    setState(() {});
                                  },
                                  child: SizedBox(
                                    height: 95,
                                    child: Card(
                                      child: ListTile(
                                        leading:AppIconBelumBaca(),
                                        title: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              belumbaca[index].idpel.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                            Text(belumbaca[index].nama,
                                              style: TextStyle(
                                                color: Colors.orange,
                                              ),
                                            ),
                                            Text(belumbaca[index].tagihan),
                                            Text(belumbaca[index].nama),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                                    })
                                : Text("No Data"),
        ]));
  }

  Widget _statusItem(String menu) {
    return TextButton(
        onPressed: () {
          pilihStatus(menu);
        },
        child: AnimatedDefaultTextStyle(
          style: _pilihStatus == menu
              ? TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)
              : TextStyle(fontSize: 14.0, color: Colors.grey),
          duration: const Duration(milliseconds: 300),
          child: Text(menu),
        ));
  }

  pilihStatus(String menu) {
    setState(() {
      _pilihStatus = menu;
    });
  }
}

class NamaPelanggan {
  String nama;
  bool status;
  int idpel;
  String tagihan;

  NamaPelanggan({this.idpel, this.nama, this.status, this.tagihan});
}
