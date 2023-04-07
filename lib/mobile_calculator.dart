import 'package:flutter/material.dart';
import 'package:login_rush/common_widget/common_button.dart';

class MobileCalculator extends StatefulWidget {
  const MobileCalculator({Key? key}) : super(key: key);

  @override
  State<MobileCalculator> createState() => _MobileCalculatorState();
}

class _MobileCalculatorState extends State<MobileCalculator> {
  String? press = "";
  String? val = "";
  List? list = [];
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];
  TextEditingController userInputController = TextEditingController();
  TextEditingController ansController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: userInputController,
            scrollPadding: EdgeInsets.only(right: 10),
            decoration: InputDecoration(
                filled: true,
                hintText: "Enter Number :",
                fillColor: Colors.grey.shade200,
                border: InputBorder.none),
            onTap: () {},
            onChanged: (value) {
              debugPrint("on change called ");
              debugPrint("$value");
              // userInputController.text = value;

              setState(() {});
            },
          ),
          SizedBox(
            height: 10,
          ),

          SizedBox(
            height: 10,
          ),
          Text(
            userInputController.text,
            style: TextStyle(color: Colors.blueAccent, fontSize: 30),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, index) {
                return MyButton(
                  buttonText: buttons[index],
                  color: Colors.grey.shade200,
                  onTap: () {
                    debugPrint("preesed ---->>${buttons[index]}");

                    press = press! + buttons[index];
                    userInputController.text = press!;

                    setState(() {});
                  },
                );
              },
            ),
          ), // GridView
        ],
      ),
    );
  }
}
