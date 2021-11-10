import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_pdam/common/ui/app_icon_camera.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class PickPicture extends StatefulWidget {
  @override
  State<PickPicture> createState() => _PickPictureState();
}

class _PickPictureState extends State<PickPicture> {
  File _image;

  Future<void> getPictureCamera() async {
    final imageFile = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    if (imageFile == null) {
      return;
    }

    _cropSquareImage(File(imageFile.path));
  }

  Future<void> getPictureGallery() async {
    final imageFile = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);
    if (imageFile == null) {
      return;
    }

    _cropSquareImage(File(imageFile.path));
  }

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              _image != null
                  ? Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Image.file(
                        _image,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.infinity,
                      child: IconCamera(
                        size: 40,
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(4),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueAccent),
                        ),
                        child: Icon(
                          Icons.camera,
                          size: 30,
                        ),
                        onPressed: () {
                          getPictureCamera();
                        },
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(4),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueAccent),
                        ),
                        child: Icon(
                          Icons.folder,
                          size: 40,
                        ),
                        onPressed: () {
                          getPictureGallery();
                        },
                      ),
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
}
