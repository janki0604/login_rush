import 'package:flutter/material.dart';

class Calculation extends StatefulWidget {
  const Calculation({Key? key}) : super(key: key);

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  TextEditingController numberOneController = TextEditingController();
  TextEditingController numberTwoController = TextEditingController();
  int? ans;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: numberOneController,
          scrollPadding: EdgeInsets.only(right: 10),
          decoration: InputDecoration(
              filled: true,
              hintText: "A :",
              fillColor: Colors.grey.shade200,
              border: InputBorder.none),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: numberTwoController,
          scrollPadding: EdgeInsets.only(right: 10),
          decoration: InputDecoration(
              filled: true,
              hintText: "B :",
              fillColor: Colors.grey.shade200,
              border: InputBorder.none),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                ans = int.parse(numberOneController.text) +
                    int.parse(numberTwoController.text);
                setState(() {});
              },
              child: Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () {
                ans = int.parse(numberOneController.text) -
                    int.parse(numberTwoController.text);
                setState(() {});
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            ans = int.parse(numberOneController.text) *
                int.parse(numberTwoController.text);
            setState(() {});
          },
          child: Text("*"),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "ANS: $ans",
          style: TextStyle(fontSize: 20),
        ),
      ],
    ));
  }
}
