import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart';
import 'package:convert/convert.dart';
import 'package:file_picker/file_picker.dart';

class Home_Screen extends StatefulWidget {
  Home_Screen({super.key});
  String imageurl = "";

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  PlatformFile? pickedFile;
  File? imagefile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          if (imagefile != null)
            Container(
              width: 400,
              height: 400,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: FileImage(
                      imagefile!,
                    ),
                    fit: BoxFit.cover),
                color: Colors.grey,
                border: Border.all(width: 8, color: Colors.black38),
                borderRadius: BorderRadius.circular(12),
              ),
            )
          else
            Container(
              width: 400,
              height: 400,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(width: 8, color: Colors.black38),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "image shougld appuer here",
                style: TextStyle(fontSize: 26),
              ),
            ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  child: Text(
                    "photo taken",
                    style: TextStyle(fontSize: 22),
                  ),
                  onPressed: () => getimage(source: ImageSource.camera),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: ElevatedButton(
                  child: Text(
                    "choose  picture",
                    style: TextStyle(fontSize: 22),
                  ),
                  onPressed: () => getimage(source: ImageSource.gallery),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // print(Image.file(imagefile!));
              uploadFile();
            },
            child: Text("upload pictures"),
          )
        ],
      ),
    );
  }

  // void pickUploadImage() async {
  //   final image = await ImagePicker().pickImage(
  //       source: ImageSource.gallery,
  //       maxWidth: 500,
  //       maxHeight: 500,
  //       imageQuality: 70);
  //   Reference ref =
  //       FirebaseStorage.instance.ref().child("image/uplogeimage.jpg");
  //   await ref.putFile(File(image!.path));
  //   ref.getDownloadURL().then((value) {
  //     print(value);
  //   });
  // }

  // Future upload() async {
  //   if (imagefile == null) return "sorey";

  //   String base64 = base64Encode(imagefile!.readAsBytesSync());
  //   String imagename = imagefile!.path.split("/").last;
  //   print(imagename);
  // }

  Future uploadFile() async {
    final path = "files${pickedFile!.name}";
    final filee = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(filee);
  }

  Future<void> getimage({required ImageSource source}) async {
    final filee = await ImagePicker().pickImage(source: source);
    try {
      if (filee?.path != null) {
        setState(() {
          imagefile = File(filee!.path);
        });
      }
    } catch (e) {
      // print(Image.file(imagefile!));
    }
  }
}
