import 'package:flutter/material.dart';
import 'package:mobile_pdam/views/RBM/rbm_detail.dart';
import 'package:one_context/one_context.dart';

class RBMView extends StatefulWidget {
  const RBMView({Key key}) : super(key: key);

  @override
  _RBMViewState createState() => _RBMViewState();
}

class _RBMViewState extends State<RBMView> {
  List<NamaMeter> namameter = [
    NamaMeter(nama: "019AABBH", tgl: '2021-02-01'),
    NamaMeter(nama: "0134SLFT", tgl: '2021-02-01'),
    NamaMeter(nama: "0999DUMMY", tgl: '2021-02-01'),
    NamaMeter(nama: "0998DUMMY", tgl: '2021-02-01'),
    NamaMeter(nama: "0765DUMMY", tgl: '2021-02-01'),
    NamaMeter(nama: "09DUMMY", tgl: '2021-02-01'),
    NamaMeter(nama: "045DUMMY", tgl: '2021-02-01'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: OneContext().builder,
        home: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: AppBar(
                elevation: 0.0,
              )),
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(children: [
              SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 40.0, bottom: 40),
                            child: Text('Daftar Baca Meter ',
                                style: TextStyle(
                                    fontFamily: 'Sofia',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                          ),
                          Container(
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
                                    hintText: 'Lets find what you want...',
                                    hintStyle: TextStyle(
                                        color: Colors.black38,
                                        fontFamily: 'Sofia',
                                        fontSize: 12.0),
                                    contentPadding: EdgeInsets.only(top: 15.0),
                                    prefixIcon:
                                        Icon(Icons.search, color: Colors.grey)),
                              )),
                          SizedBox(height: 20),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: namameter.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: GestureDetector(
                                    onTap: () {
                                      OnePlatform.reboot(
                                          setUp: () {
                                            OneContext().key =
                                                GlobalKey<NavigatorState>();
                                          },
                                          builder: () => RbmDetail(
                                                nomorMeter:
                                                    namameter[index].nama,
                                              ));
                                    },
                                    child: ListTile(
                                      title: Text(namameter[index].nama),
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}

class NamaMeter {
  String nama;
  String tgl;

  NamaMeter({this.nama, this.tgl});
}
