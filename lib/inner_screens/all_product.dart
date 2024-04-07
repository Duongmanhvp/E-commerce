import 'package:e_commerce/services/utils.dart';
import 'package:e_commerce/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class AllProductWidget extends StatelessWidget {
  const AllProductWidget({super.key});
  static const String routeProfileName = "/ProductScreen";

  @override
  Widget build(BuildContext context) {
    final themeState = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: color,
          ),
        ),
        title: TextWidget(
          text: "All Products",
          color: color,
          fontSize: 24,
          isTitle: true,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
