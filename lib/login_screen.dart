// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final myController = TextEditingController();
//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     myController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           TextField(
//             controller: myController,
//             decoration: InputDecoration(labelText: 'Enter Fruit Name'),
//           ),
//           // Step 1 <-- SEE HERE
//           ElevatedButton(
//             onPressed: () {
//               // Step 3 <-- SEE HERE
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DetailScreen(title: myController.text),
//                 ),
//               );
//             },
//             child: const Text(
//               'Pass Data To Next Screen',
//               style: TextStyle(fontSize: 24),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class DetailScreen extends StatefulWidget {
//   // In the constructor, require a Todo.
//   const DetailScreen({Key? key, required this.title}) : super(key: key);
//   // Step 2 <-- SEE HERE
//   final String title;
//   @override
//   State<DetailScreen> createState() => _DetailScreenState();
// }
//
// class _DetailScreenState extends State<DetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // Use the Todo to create the UI.
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 50,
//             ),
//             // Step 4 <-- SEE HERE
//             Text(
//               '${widget.title}',
//               style: TextStyle(fontSize: 54),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:login_rush/data_pass.dart';
import 'package:login_rush/model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  String? email = "janu@";
  String? name = "janki";
  String? mobile = "1234";
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
              TextFormField(
                validator: (value) {
                  if (value != name) {
                    return "enter Correct Name";
                  }

                  return null;
                },
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
                  if (value != mobile) {
                    return "enter Correct mobile number";
                  }

                  return null;
                },
                controller: numberController,
                scrollPadding: EdgeInsets.only(right: 10),
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Enter Number",
                    fillColor: Colors.grey.shade200,
                    prefixIcon: Icon(Icons.person),
                    border: InputBorder.none),
              ),
              TextFormField(
                validator: (value) {
                  if (value != email) {
                    return "enter Correct email";
                  }

                  return null;
                },
                controller: mailController,
                scrollPadding: EdgeInsets.only(right: 10),
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Enter Mail",
                    fillColor: Colors.grey.shade200,
                    prefixIcon: Icon(Icons.person),
                    border: InputBorder.none),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Logged in!!",
                          ),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DataPass(
                            information: Model(
                              name: nameController.text,
                              number: int.parse(numberController.text),
                              mail: mailController.text,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text("Log in"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
 Padding(
                padding: const EdgeInsets.all(24),
                child: ElevatedButton(
                  onPressed: () async {
                    if (nameController.text == name) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DataPass(
                            information: ToDoModel(
                              name: nameController.text,
                              surname: surnameController.text,
                              mail: mailController.text,
                              number: int.parse(
                                numberController.text,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text("Log in"),
                ),
              ),



*/
