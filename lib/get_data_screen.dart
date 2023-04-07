import 'package:flutter/material.dart';
import 'package:login_rush/add_data_screen.dart';
import 'package:login_rush/model_two.dart';

class GetDataScreen extends StatefulWidget {
  const GetDataScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GetDataScreen> createState() => _GetDataScreenState();
}

class _GetDataScreenState extends State<GetDataScreen> {
  List<ModelTwo> listOfData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Saved Name And Contacts",
        ),
      ),
      body: Column(
        children: [
          listOfData.isEmpty
              ? SizedBox()
              : Expanded(
                  child: ListView.builder(
                    itemCount: listOfData.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(
                        "${listOfData[index].name}",
                      ),
                      subtitle: Text(
                        "${listOfData[index].number}",
                      ),
                    ),
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic data = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDataScreen(),
            ),
          );
          if (data != null) {
            listOfData.add(data);
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
