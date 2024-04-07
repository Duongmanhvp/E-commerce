import 'package:e_commerce/provider/dark_theme_provider.dart';
import 'package:e_commerce/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {super.key,
      required this.catText,
      required this.catImgPath,
      required this.catColor});
  final String catText, catImgPath;
  final Color catColor;
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    //final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    double _screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: catColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: catColor.withOpacity(0.7),
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(catImgPath),
              )),
            ),
            TextWidget(
              text: catText,
              color: catColor,
              fontSize: 20,
              isTitle: true,
            )
          ],
        ),
      ),
    );
  }
}
