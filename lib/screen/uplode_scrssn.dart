import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Uplode_screen extends StatefulWidget {
  const Uplode_screen({super.key});

  @override
  State<Uplode_screen> createState() => _Uplode_screenState();
}

class _Uplode_screenState extends State<Uplode_screen> {
  PlatformFile? pickedFile;

  Future uploadeFile() async {
    final path = "files${pickedFile!.name}";
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (pickedFile != null)
            Container(
              width: double.infinity,
              height: 400,
              child: Container(
                color: Color.fromARGB(255, 8, 55, 88),
                child: Center(
                    child: Image.file(
                  File(pickedFile!.path!),
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                )),
              ),
            ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: selectFile,
            child: Text("Select File"),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: uploadeFile,
            child: Text("Uploade File"),
          ),
        ],
      ),
    );
  }
}
