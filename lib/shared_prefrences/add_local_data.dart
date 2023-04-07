import 'package:flutter/material.dart';
import 'package:login_rush/shared_prefrences/get_local_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddLocalData extends StatefulWidget {
  const AddLocalData({Key? key}) : super(key: key);

  @override
  State<AddLocalData> createState() => _AddLocalDataState();
}

class _AddLocalDataState extends State<AddLocalData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  SharedPreferences? pref;

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

    nameController.clear();
    numberController.clear();
  }

  getData() async {
    if (pref!.containsKey("name") && pref!.containsKey('number')) {
      nameController.text = pref!.getString("name")!;
      numberController.text = pref!.getString("number")!;
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
                        builder: (context) => GetLocalData(
                          personName: nameController.text,
                          personNumber: numberController.text,
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
