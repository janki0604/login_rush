import 'package:flutter/material.dart';
import 'package:login_rush/model_two.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({Key? key}) : super(key: key);

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  ModelTwo modelTwo = ModelTwo();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                scrollPadding: EdgeInsets.only(right: 10),
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Enter name",
                    fillColor: Colors.grey.shade200,
                    prefixIcon: Icon(Icons.person),
                    border: InputBorder.none),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.length != 10) {
                    return "Enter Valid number";
                  }
                  return null;
                },
                controller: numberController,
                scrollPadding: EdgeInsets.only(right: 10),
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Enter number",
                    fillColor: Colors.grey.shade200,
                    prefixIcon: Icon(Icons.call),
                    border: InputBorder.none),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    modelTwo = ModelTwo(
                      name: nameController.text,
                      number: int.parse(numberController.text),
                    );
                    Navigator.pop(context, modelTwo);
                  }
                },
                child: Text("add data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
