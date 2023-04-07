// import 'package:login_rush/to_do_model.dart';
//
// class ModelData{
//   static List<ToDoModel> getData(){
//     return [
//       // FoodModel(name: "pizza",price: 200),
//       // FoodModel(name: "burger",price: 100),
//       // FoodModel(name: "sendwish",price: 150),
//       // FoodModel(name: "panipuri",price: 50),
//
//     ];
//
//   }
// }

import 'package:login_rush/model_one.dart';

class ModelData {
  static List<ModelOne> getData() {
    return [
      ModelOne(
        flower: "rose",
        fruit: "mango",
      ),
      ModelOne(
        fruit: "apple",
        flower: "lotus",
      ),
    ];
  }
}
