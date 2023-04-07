import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_rush/shared_preference_model/share_preference_model.dart';
import 'package:login_rush/shared_prefrences/local_data.dart';

class AddLocalDataList extends StatefulWidget {
  final PersonModel? personItem;
  const AddLocalDataList({Key? key, this.personItem}) : super(key: key);

  @override
  State<AddLocalDataList> createState() => _AddLocalDataListState();
}

class _AddLocalDataListState extends State<AddLocalDataList> {
  PersonModel personModel = PersonModel();

  //SET AND GET FUNCTION OF SHAREd PREFERENCE IN LOCAL CLASS
  LocalData localData = LocalData();

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    if (await localData.containData(localData.todoData)) {
      dynamic data = await localData.getModel(localData.todoData);
      debugPrint("data ---------->> $data");
      personModel = PersonModel.fromJson(data);
    } else {
      personModel.infoList = [];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heigth = size.height;
    // double width = size.width;
    // double text = MediaQuery.textScaleFactorOf(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Add your name and number",
        ),
        backgroundColor: Colors.pinkAccent.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Name",
              ),
            ),
            SizedBox(
              height: heigth / 90,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter name",
              ),
            ),
            SizedBox(
              height: heigth / 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Number",
              ),
            ),
            SizedBox(
              height: heigth / 90,
            ),
            TextField(
              controller: numberController,
              decoration: InputDecoration(
                hintText: "Enter Number",
              ),
            ),
            SizedBox(
              height: heigth / 40,
            ),
            SizedBox(
              height: heigth / 90,
            ),
            SizedBox(
              height: heigth / 40,
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text != "" && numberController.text != "") {
                  InfoList infoList = InfoList(
                    name: nameController.text,
                    number: numberController.text,
                  );
                  personModel.infoList!.add(infoList);
                  // localData.removeData(localData.todoData);
                  localData.setModel(
                    localData.todoData,
                    jsonEncode(personModel),
                  );

                  Navigator.pop(context);
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.pinkAccent.shade700,
                ),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: const Text('Add to List'),
            ),
          ],
        ),
      ),
    );
  }
}
