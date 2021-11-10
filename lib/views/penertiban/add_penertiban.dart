import 'package:flutter/material.dart';
import 'package:mobile_pdam/common/ui/app_text.dart';
import 'package:mobile_pdam/common/ui/under_constructionpage.dart';
import 'package:mobile_pdam/views/penertiban/penertiban_view.dart';
import 'package:one_context/one_context.dart';

class AddPenertiban extends StatefulWidget {
  const AddPenertiban({Key key}) : super(key: key);

  @override
  _AddPenertibanState createState() => _AddPenertibanState();
}

class _AddPenertibanState extends State<AddPenertiban> {
  var _pilihprofesi;
  TextEditingController controllerNosal;

  List<DropdownMenuItem> generateItem(List<Status> pilihanStatus) {
    List<DropdownMenuItem> items = [];
    for (var item in pilihanStatus) {
      items.add(DropdownMenuItem(
        child: Text(item.status),
        value: item,
      ));
    }
    return items;
  }

  Status pilihstatus;
  List<Status> pilihanStatus = [
    Status("Tukang1"),
    Status("Tukang2"),
    Status("Tukang3"),
    Status("Tukang4"),
    Status("Tukang5"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Kode Transisi")),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 30.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Tugas",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Wrap(
                    spacing: 20.0,
                    children: [
                      _profesi(Icons.ac_unit_sharp, 'Tukang1'),
                      _profesi(Icons.ac_unit_sharp, 'Tukang2'),
                      _profesi(Icons.ac_unit_sharp, 'Tukang3'),
                      _profesi(Icons.ac_unit_sharp, 'Tukang4'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 60.0),
              Row(
                children: [
                  Text(
                    "No Sal",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Container(
                    height: 50,
                    width: 210,
                    child: AppText(
                      text: "Nomor Saluran",
                      texteditingController: controllerNosal,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60.0),
              Row(
                children: [
                  Text(
                    "Foto",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 60.0,
                  ),
                  Container(
                    height: 39,
                    width: 155,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Foto",
                          hintStyle: TextStyle(fontSize: 14.0)),
                      controller: controllerNosal,
                      enabled: false,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    height: 39,
                    width: 39,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.photo_camera),
                  ),
                ],
              ),
              SizedBox(height: 60.0),
              Row(
                children: [
                  Text(
                    "Status",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Container(
                    height: 50,
                    width: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[300],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: new DropdownButton(
                        value: pilihstatus,
                        dropdownColor: Colors.grey[300],
                        hint: new Text(
                          "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.0),
                        ),
                        items: generateItem(pilihanStatus),
                        //elevation: 0,
                        onChanged: (item) {
                          setState(() {
                            (pilihstatus != null)
                                ? print(pilihstatus.status)
                                : print("saya tidak paham");
                            pilihstatus = item;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 170.0,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        OnePlatform.reboot(
                          setUp: () {
                            OneContext().key = GlobalKey<NavigatorState>();
                          },
                          builder: () => PenertibanView(),
                        );
                        print('Pressed');
                      },
                    ),
                    ElevatedButton(
                      child: Text('Next'),
                      onPressed: () {
                        OnePlatform.reboot(
                          setUp: () {
                            OneContext().key = GlobalKey<NavigatorState>();
                          },
                          builder: () => UnderConstructiopage(),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _profesi(IconData iconData, String profesi) {
    return InkWell(
        onTap: () {
          pilihprofesi(profesi);
          print(profesi);
        },
        child: CircleAvatar(
            backgroundColor:
                _pilihprofesi == profesi ? Colors.blue : Colors.grey,
            radius: 20,
            child: Icon(
              Icons.accessibility_outlined,
              color: _pilihprofesi == profesi ? Colors.white : Colors.grey[600],
            )));
  }

  pilihprofesi(String profesi) {
    setState(() {
      _pilihprofesi = profesi;
    });
  }
}

class Status {
  String status;
  Status(this.status);
}
