import 'package:e_commerce/services/utils.dart';
import 'package:e_commerce/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {super.key,
      required this.price,
      required this.salePrice,
      required this.textPrice,
      required this.isSale});
  final double price, salePrice;
  final String textPrice;
  final bool isSale;
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    double userPrice = isSale ? salePrice : price;
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextWidget(
              text:
                  "\$${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}",
              color: color,
              fontSize: 16,
              isTitle: true,
            ),
            const SizedBox(
              width: 5,
            ),
            Visibility(
              visible: isSale ? true : false,
              child: Text(
                "\$${(price * int.parse(textPrice)).toStringAsFixed(2)}",
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
