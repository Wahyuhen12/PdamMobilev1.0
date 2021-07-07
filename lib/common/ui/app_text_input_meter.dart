import 'package:flutter/material.dart';
import 'package:mobile_pdam/common/ui/app_colors.dart';
import 'package:mobile_pdam/common/ui/app_icon_camera.dart';

class TextInputMeter extends StatefulWidget {
  @override
  _TextInputMeterState createState() => _TextInputMeterState();
}

class _TextInputMeterState extends State<TextInputMeter> {
  String _lbkb;
  String _lbkb1;
  String _lbkb2;
  String _lbkb3;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // STAN
          Text(
            "STAN",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black.withOpacity(0.6),
              fontSize: 18,
            ),
          ),
          TextFormField(
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              hintStyle: Theme.of(context).textTheme.bodyText2.merge(
                    TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
              hintText: "1029000198",
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // LBKB
          Text(
            "LBKB",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black.withOpacity(0.6),
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Flexible(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.3),
                    )),
                  ),
                  value: _lbkb,
                  items: ["Ada anjing Galak", "Pagar dikunci", "Ada Lumut"]
                      .map(
                        (String newValue) => DropdownMenuItem<String>(
                          child: Text(
                            newValue.toString(),
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          value: newValue,
                        ),
                      )
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _lbkb = newValue;
                    });
                  },
                ),
              ),
              IconCamera(
                size: 30,
                color: Colors.black,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          // LBKB I
          Text(
            "LBKB I",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black.withOpacity(0.6),
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Flexible(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.3),
                    )),
                  ),
                  value: _lbkb1,
                  items: ["Ada anjing Galak", "Pagar dikunci", "Ada Lumut"]
                      .map(
                        (String newValue) => DropdownMenuItem<String>(
                          child: Text(
                            newValue.toString(),
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          value: newValue,
                        ),
                      )
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _lbkb1 = newValue;
                    });
                  },
                ),
              ),
              IconCamera(
                size: 30,
                color: Colors.black,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          // LBKB II
          Text(
            "LBKB II",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black.withOpacity(0.6),
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Flexible(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.3),
                    )),
                  ),
                  value: _lbkb2,
                  items: ["Ada anjing Galak", "Pagar dikunci", "Ada Lumut"]
                      .map(
                        (String newValue) => DropdownMenuItem<String>(
                          child: Text(
                            newValue.toString(),
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          value: newValue,
                        ),
                      )
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _lbkb2 = newValue;
                    });
                  },
                ),
              ),
              IconCamera(
                size: 30,
                color: Colors.black,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          // LBKB III
          Text(
            "LBKB III",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black.withOpacity(0.6),
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Flexible(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.3),
                    )),
                  ),
                  value: _lbkb3,
                  items: ["Ada anjing Galak", "Pagar dikunci", "Ada Lumut"]
                      .map(
                        (String newValue) => DropdownMenuItem<String>(
                          child: Text(
                            newValue.toString(),
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          value: newValue,
                        ),
                      )
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _lbkb3 = newValue;
                    });
                  },
                ),
              ),
              IconCamera(
                size: 30,
                color: Colors.black,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          // No. Hp
          Text(
            "No. Hp",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black.withOpacity(0.6),
              fontSize: 18,
            ),
          ),
          TextFormField(
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              hintStyle: Theme.of(context).textTheme.bodyText2.merge(
                    TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
              hintText: "083142872098",
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // Keterangan
          Text(
            "Keterangan",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black.withOpacity(0.6),
              fontSize: 18,
            ),
          ),
          TextFormField(
            maxLines: 4,
            maxLength: 100,
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),

          Container(
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              color: Colors.blueAccent,
            ),
            child: Center(
              child: Text(
                "Kirim Data",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
