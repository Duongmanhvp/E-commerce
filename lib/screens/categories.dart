import 'package:e_commerce/services/utils.dart';
import 'package:e_commerce/widgets/categories_widget.dart';
import 'package:e_commerce/widgets/text_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];
  List<Map<String, dynamic>> catInfo = [
    {
      "catImgPath": "assets/images/cats/fruits.png",
      "catText": "Fruits",
    },
    {
      "catImgPath": "assets/images/cats/grains.png",
      "catText": "Grains",
    },
    {
      "catImgPath": "assets/images/cats/nuts.png",
      "catText": "Nuts",
    },
    {
      "catImgPath": "assets/images/cats/spices.png",
      "catText": "Spices",
    },
    {
      "catImgPath": "assets/images/cats/Spinach.png",
      "catText": "Spinach",
    },
    {
      "catImgPath": "assets/images/cats/veg.png",
      "catText": "Vegetables",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: "Categories",
            color: color,
            fontSize: 20,
            isTitle: true,
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: List.generate(
            6,
            (index) {
              return CategoriesWidget(
                catText: catInfo[index]['catText'],
                catImgPath: catInfo[index]['catImgPath'],
                catColor: gridColors[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
