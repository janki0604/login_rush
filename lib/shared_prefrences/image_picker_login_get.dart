import 'dart:io';

import 'package:flutter/material.dart';

class ImagePickerLoginGet extends StatefulWidget {
  final String? personName;
  final String? personNumber;
  final String? imageProfile;

  const ImagePickerLoginGet(
      {Key? key, this.personName, this.personNumber, this.imageProfile})
      : super(key: key);

  @override
  State<ImagePickerLoginGet> createState() => _ImagePickerLoginGetState();
}

class _ImagePickerLoginGetState extends State<ImagePickerLoginGet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.personName}",
              style: TextStyle(
                color: Colors.pink,
                fontSize: 30,
              ),
            ),
            Text(
              "${widget.personNumber}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            widget.imageProfile == null
                ? SizedBox()
                : Image.file(
                    File(widget.imageProfile!),
                  ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "back",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
