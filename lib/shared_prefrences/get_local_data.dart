import 'package:flutter/material.dart';

class GetLocalData extends StatefulWidget {
  final String? personName;
  final String? personNumber;
  const GetLocalData({Key? key, this.personName, this.personNumber})
      : super(key: key);

  @override
  State<GetLocalData> createState() => _GetLocalDataState();
}

class _GetLocalDataState extends State<GetLocalData> {
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
