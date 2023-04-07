import 'package:flutter/material.dart';

class TextFieldUi extends StatefulWidget {
  const TextFieldUi({Key? key}) : super(key: key);

  @override
  State<TextFieldUi> createState() => _TextFieldUiState();
}

class _TextFieldUiState extends State<TextFieldUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/newyork.jpg"),
                fit: BoxFit.cover,
                opacity: 100,
              ),
            ),
            child: null /* add child content here */,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "to get benigits enter password and email\nhere",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                      child: TextFormField(
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.3,
                    ),
                    SizedBox(
                      height: 70,
                      child: TextFormField(
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
