import 'package:flutter/material.dart';
import 'package:login_rush/model.dart';

class DataPass extends StatefulWidget {
  final Model? information;

  const DataPass({Key? key, this.information}) : super(key: key);

  @override
  State<DataPass> createState() => _DataPassState();
}

class _DataPassState extends State<DataPass> {
  // List<ModelOne> modelData = ModelData.getData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("name:${widget.information!.name}"),
          Text("mail:${widget.information!.mail}"),
          Text("number:${widget.information!.number}"),
          // Expanded(
          //   child: ListView.builder(
          //     itemBuilder: (context, index) => Container(
          //       child: Text(
          //           "${modelData[index].flower}\n${modelData[index].fruit}\n"),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
