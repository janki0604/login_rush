import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_rush/shared_prefrences/image_picker_login_get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImagePickerLogin extends StatefulWidget {
  const ImagePickerLogin({Key? key}) : super(key: key);

  @override
  State<ImagePickerLogin> createState() => _ImagePickerLoginState();
}

class _ImagePickerLoginState extends State<ImagePickerLogin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  SharedPreferences? pref;
  ImagePicker picker = ImagePicker();
  XFile? imageFile;

  String? profile = "";

  @override
  void initState() {
    // TODO: implement initState
    getInstance();
    super.initState();
  }

  getInstance() async {
    numberController.clear();
    nameController.clear();
    pref = await SharedPreferences.getInstance();
    getData();
  }

  setData() async {
    await pref!.setString("name", nameController.text);
    await pref!.setString("number", numberController.text);
    await pref!.setString("image", imageFile!.path);
    nameController.clear();
    numberController.clear();
  }

  getData() async {
    if (pref!.containsKey("name") && pref!.containsKey('number')) {
      nameController.text = pref!.getString("name")!;
      numberController.text = pref!.getString("number")!;

      profile = pref!.getString("image");
    }

    /* else if (pref!.containsKey('name')) {
      nameController.text = pref!.getString("name")!;
      numberController.text = "";
    } else if (pref!.containsKey('number')) {
      nameController.text = "";
      numberController.text = pref!.getString("number")!;
    } else {
      nameController.text = "";
      numberController.text = "";
    }*/
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                imageFile = await picker.pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 100,
                  maxHeight: 200,
                  maxWidth: 200,
                );
                setState(() {});
                debugPrint(
                    "imageFile!.path ------------>>> ${imageFile!.path}");
              },
              child: Text("select from gallery"),
            ),
            imageFile == null
                ? SizedBox()
                : Image.file(
                    File(imageFile!.path),
                  ),
            TextField(
              onSubmitted: (value) {
                nameController.clear();
              },
              controller: nameController,
              decoration: InputDecoration(
                  filled: true,
                  hintText: "Enter name",
                  fillColor: Colors.grey.shade200,
                  prefixIcon: Icon(Icons.person),
                  border: InputBorder.none),
            ),
            TextField(
              onSubmitted: (value) {
                numberController.clear();
              },
              controller: numberController,
              decoration: InputDecoration(
                  filled: true,
                  hintText: "Enter number",
                  fillColor: Colors.grey.shade200,
                  prefixIcon: Icon(Icons.call),
                  border: InputBorder.none),
            ),
            // Text(
            //     "name : ${nameController.text} \n number : ${numberController.text}"),
            ElevatedButton(
              onPressed: () {
                if (nameController.text != "" && numberController.text != "") {
                  setData();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("please enter value")));
                }

                // getData();
              },
              child: Text("Add"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  getData();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImagePickerLoginGet(
                          personName: nameController.text,
                          personNumber: numberController.text,
                          imageProfile: profile,
                        ),
                      ));
                },
                child: Text("Show"))
          ],
        ),
      ),
    );
  }
}
