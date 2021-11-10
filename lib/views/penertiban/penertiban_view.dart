import 'package:flutter/material.dart';
import 'package:mobile_pdam/common/ui/app_icon_button.dart';
import 'package:flutter/services.dart';
import 'package:mobile_pdam/common/ui/app_icon_usbu_bogkar.dart';
import 'package:mobile_pdam/common/ui/app_icon_usbu_putus.dart';
import 'package:mobile_pdam/common/ui/app_icon_usbu_sambung.dart';
import 'package:mobile_pdam/views/dashboard/dashboard_view.dart';
import 'package:one_context/one_context.dart';

import 'add_penertiban.dart';

class PenertibanView extends StatefulWidget {
  const PenertibanView({Key key}) : super(key: key);

  @override
  _PenertibanViewState createState() => _PenertibanViewState();
}

class _PenertibanViewState extends State<PenertibanView> {
  var _pilihStatus = 'All';

  List<Penertiban> penertiban = [
    Penertiban(nama: "Dummy 1", status: "Sambung"),
    Penertiban(nama: "Dummy 2", status: "Putus"),
    Penertiban(nama: "Dummy 3", status: "Bongkar"),
    Penertiban(nama: "Dummy 4", status: "Sambung"),
    Penertiban(nama: "Dummy 5", status: "Putus"),
    Penertiban(nama: "Dummy 6", status: "Bongkar"),
  ];

  List<Penertiban> penertibanSambung = [
    Penertiban(nama: "Dummy 1", status: "Sambung"),
    Penertiban(nama: "Dummy 4", status: "Sambung"),
  ];

  List<Penertiban> penertibanPutus = [
    Penertiban(nama: "Dummy 2", status: "Putus"),
    Penertiban(nama: "Dummy 5", status: "Putus"),
  ];

  List<Penertiban> penertibanBongkar = [
    Penertiban(nama: "Dummy 3", status: "Bongkar"),
    Penertiban(nama: "Dummy 6", status: "Bongkar"),
  ];

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
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _statusPenertiban('All'),
                    _statusPenertiban('Putus'),
                    _statusPenertiban('Sambung'),
                    _statusPenertiban('Bongkar'),
                  ],
                ),
              ),
              _statusPenertibanPelanggan()
            ]),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              OneContext()
                  .push(MaterialPageRoute(builder: (_) => AddPenertiban()));
            },
            child: Icon(Icons.add),
          ),
        ));
  }

  Widget _statusPenertibanPelanggan() {
    return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(children: [
          _pilihStatus == "All"
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: penertiban.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                        child: ListTile(
                          leading: penertiban[index].status == "Sambung"
                              ? AppIconUsbuSambung()
                              : penertiban[index].status == "Putus"
                                  ? AppIconUsbuPutus()
                                  : AppIconUsbuBongkar(),
                          title: Text(
                            penertiban[index].nama,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    );
                  })
              : _pilihStatus == "Sambung"
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: penertibanSambung.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Card(
                            child: ListTile(
                              leading: AppIconUsbuSambung(),
                              title: Text(
                                penertibanSambung[index].nama,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        );
                      })
                  : _pilihStatus == "Putus"
                      ? ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: penertibanPutus.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Card(
                                child: ListTile(
                                  leading: AppIconUsbuPutus(),
                                  title: Text(
                                    penertibanPutus[index].nama,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            );
                          })
                      : _pilihStatus == "Bongkar"
                          ? ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: penertibanBongkar.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Card(
                                    child: ListTile(
                                      leading: AppIconUsbuBongkar(),
                                      title: Text(
                                        penertibanBongkar[index].nama,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                );
                              })
                          : "Tidak Ada Data",
        ]));
  }

  Widget _statusPenertiban(String status) {
    return TextButton(
        onPressed: () {
          pilihStatus(status);
        },
        child: AnimatedDefaultTextStyle(
          style: _pilihStatus == status
              ? TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)
              : TextStyle(fontSize: 14.0, color: Colors.grey),
          duration: const Duration(milliseconds: 300),
          child: Text(status),
        ));
  }

  pilihStatus(String status) {
    setState(() {
      _pilihStatus = status;
    });
  }
}

class Penertiban {
  String nama, status;
  Penertiban({this.nama, this.status});
}
