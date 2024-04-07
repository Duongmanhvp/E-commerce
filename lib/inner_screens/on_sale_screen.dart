import 'package:e_commerce/services/utils.dart';
import 'package:e_commerce/widgets/sale_widget.dart';
import 'package:e_commerce/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OnSaleScreen extends StatelessWidget {
  const OnSaleScreen({super.key});
  static const String routeName = "/OnSaleScreen";

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
          text: "Sale Products",
          color: color,
          fontSize: 24,
          isTitle: true,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        padding: EdgeInsets.zero,
        childAspectRatio: size.width / (size.height * 0.6),
        children: List.generate(
          4,
          (index) {
            return const SaleWidget();
          },
        ),
      ),
    );
  }
}
