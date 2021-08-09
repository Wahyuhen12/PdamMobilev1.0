import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mobile_pdam/common/ui/app_icon_belum_baca.dart';
import 'package:mobile_pdam/common/ui/app_icon_sudah_baca.dart';
import 'package:mobile_pdam/common/ui/app_presentase_hold.dart';
import 'package:mobile_pdam/common/ui/app_presentase_none.dart';
import 'package:mobile_pdam/common/ui/app_succesDialog.dart';
import 'package:mobile_pdam/views/RBM/rbm_detail.dart';
import 'package:one_context/one_context.dart';

class JaringanView extends StatefulWidget {
  const JaringanView({Key key}) : super(key: key);

  @override
  _JaringanViewState createState() => _JaringanViewState();
}

class _JaringanViewState extends State<JaringanView> {
  List<NamaJaringan> _namaJaringan = [
    NamaJaringan(nama: "JARINGAN 1"),
    NamaJaringan(nama: "JARINGAN 2"),
    NamaJaringan(nama: "JARINGAN 3"),
    NamaJaringan(nama: "JARINGAN 4"),
    NamaJaringan(nama: "JARINGAN 5"),
    NamaJaringan(nama: "JARINGAN 6"),
    NamaJaringan(nama: "JARINGAN 7"),
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
              title: Text(
                'Daftar Unit ',
                style: TextStyle(
                    fontFamily: 'Sofia',
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                    ))
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
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _namaJaringan.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
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
                                  leading: Icon(
                                    Icons.location_on,
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _namaJaringan[index].nama,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
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
                        }),
                  ),
                ),
              ],
            )));
  }
}

class NamaJaringan {
  String nama;
  bool status;
  int idpel;
  String tagihan;

  NamaJaringan({this.idpel, this.nama, this.status, this.tagihan});
}
