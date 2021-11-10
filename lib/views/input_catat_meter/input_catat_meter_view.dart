import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_pdam/common/ui/app_button_send.dart';
import 'package:mobile_pdam/common/ui/app_dropdown_field_camera.dart';
import 'package:mobile_pdam/common/ui/app_text_input_meter.dart';
import 'package:mobile_pdam/views/input_catat_meter/input_catat_meter_presenter.dart';
import 'package:mobile_pdam/views/pick_picture/pick_picture_view.dart';
import 'package:one_context/one_context.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

import 'package:mobile_pdam/common/ui/app_icon_camera.dart';

class InputMeterView extends StatefulWidget {
  InputMeterView({this.idpel});
  final String idpel;
  @override
  _InputMeterViewState createState() => _InputMeterViewState();
}

class _InputMeterViewState extends State<InputMeterView> {
  final InputMeterPresenter inputMeterPresenter = new InputMeterPresenter();

  File _image;
  String _lbkb;
  String _lbkb1;
  String _lbkb2;
  String _lbkb3;

  // Mengambil gambar dari kamera
  Future<void> getPicture() async {
    final imageFile = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    if (imageFile == null) {
      return;
    }

    _cropSquareImage(File(imageFile.path));
  }

  // Crop gambar
  Future<File> _cropSquareImage(File imageFile) async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
      ],
      compressQuality: 70,
      compressFormat: ImageCompressFormat.jpg,
      androidUiSettings: _androidUiSettingsLocked(),
      iosUiSettings: _iosUiSettingsLocked(),
    );

    final appDir = await syspaths.getExternalStorageDirectory();
    final fileName = path.basename(croppedFile.path);
    final savedImage =
        await File(croppedFile.path).copy('${appDir.path}/$fileName');

    setState(() {
      _image = File(croppedFile.path);
    });
    return savedImage;
  }

  IOSUiSettings _iosUiSettingsLocked() => IOSUiSettings(
        aspectRatioLockEnabled: false,
        resetAspectRatioEnabled: false,
      );

  AndroidUiSettings _androidUiSettingsLocked() => AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Colors.blue,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: OneContext().navigator.key,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Text(
            widget.idpel,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    OneContext()
                        .push(MaterialPageRoute(builder: (_) => PickPicture()));
                  },
                  child: _image != null
                      ? Container(
                          width: double.infinity,
                          height: 250,
                          child: Image.file(
                            _image,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: IconCamera(
                            size: 40,
                          ),
                        ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "STAN",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 18,
                          ),
                        ),
                        TextInputMeter(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          hintText: "099007900",
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        Text(
                          "LBKB",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 18,
                          ),
                        ),
                        DropdownField(
                          value: _lbkb,
                          items: [
                            "Ada anjing Galak",
                            "Pagar dikunci",
                            "Ada Lumut",
                          ]
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
                          onPressed: () {
                            getPicture();
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        Text(
                          "LBKB I",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 18,
                          ),
                        ),
                        DropdownField(
                          value: _lbkb1,
                          items: [
                            "Ada anjing Galak",
                            "Pagar dikunci",
                            "Ada Lumut",
                          ]
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
                          onPressed: () {
                            getPicture();
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        Text(
                          "LBKB II",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 18,
                          ),
                        ),
                        DropdownField(
                          value: _lbkb2,
                          items: [
                            "Ada anjing Galak",
                            "Pagar dikunci",
                            "Ada Lumut",
                          ]
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
                          onPressed: () {
                            getPicture();
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        Text(
                          "LBKB III",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 18,
                          ),
                        ),
                        DropdownField(
                          value: _lbkb3,
                          items: [
                            "Ada anjing Galak",
                            "Pagar dikunci",
                            "Ada Lumut",
                          ]
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
                          onPressed: () {
                            getPicture();
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        Text(
                          "No. Hp",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 18,
                          ),
                        ),
                        TextInputMeter(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          hintText: "083142872098",
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
                        TextInputMeter(
                          maxLength: 100,
                          maxLines: 4,
                          textInputAction: TextInputAction.done,
                        ),
                        SizedBox(
                          height: 50,
                        ),

                        ButtonSend(
                          onTap: () {
                            print("Hello");
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
