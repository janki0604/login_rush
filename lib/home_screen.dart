import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List image = [
    "assets/images/maldives.jpg",
    "assets/images/ananya.webp",
    "assets/images/california.jpg",
    "assets/images/disha.jpg",
    "assets/images/dubai.jpeg",
    "assets/images/paris.jpg",
    "assets/images/ronaldo_two.webp",
    "assets/images/newyork.jpg",
    "assets/images/kriti.jpeg",
    "assets/images/jacqueline.jpeg",
    "assets/images/laptop.jpg",
    "assets/images/kiara.jpeg",
    "assets/images/rashmika.jpg",
    "assets/images/fox.png",
  ];
  List name = [
    "maldives",
    "annaya",
    "california",
    "disha",
    "dubai",
    "paris",
    "ronaldo",
    "new york",
    "kriti",
    "jacqueline",
    "laptop",
    "kiara",
    "rashmika",
    "fox",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: name.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image[index],
                  fit: BoxFit.fill,
                  height: 190,
                  width: 250,
                ),
              ),
              Text(
                "${name[index]}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
