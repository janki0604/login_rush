import 'package:flutter/material.dart';
import 'package:login_rush/shared_preference_model/share_preference_model.dart';
import 'package:login_rush/shared_prefrences/add_local_data_list.dart';
import 'package:login_rush/shared_prefrences/local_data.dart';

class GetLocalDataList extends StatefulWidget {
  const GetLocalDataList({Key? key}) : super(key: key);

  @override
  State<GetLocalDataList> createState() => _GetLocalDataListState();
}

class _GetLocalDataListState extends State<GetLocalDataList> {
  PersonModel? listOfData;
  LocalData localData = LocalData();
  @override
  void initState() {
    getTodoData();
    super.initState();
  }

  getTodoData() async {
    dynamic data = await localData.getModel(localData.todoData);
    debugPrint("display screen data------->>$data");
    listOfData = PersonModel.fromJson(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heigth = size.height;
    // double width = size.width;
    // double text = MediaQuery.textScaleFactorOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.shade700,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          "Name And Contacts",
        ),
      ),
      body: listOfData == null || listOfData!.infoList!.isEmpty
          ? Center(
              child: Text(
                "No Data Found",
              ),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                    height: heigth / 100,
                  ),
              itemCount: listOfData!.infoList!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.pinkAccent.shade100,
                  title: Text("Name :${listOfData!.infoList![index].name}"),
                  subtitle:
                      Text("Number :${listOfData!.infoList![index].number}"),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddLocalDataList(),
            ),
          ).then((value) => getTodoData());
        },
        backgroundColor: Colors.pinkAccent.shade700,
        foregroundColor: Colors.white,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
