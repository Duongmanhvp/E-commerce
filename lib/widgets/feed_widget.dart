import 'package:e_commerce/services/utils.dart';
import 'package:e_commerce/widgets/heart_widget.dart';
import 'package:e_commerce/widgets/price_widget.dart';
import 'package:e_commerce/widgets/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({super.key});

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    _controller.text = "10";
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          onTap: () => {},
          borderRadius: BorderRadius.circular(12.0),
          child: Column(
            children: [
              FancyShimmerImage(
                imageUrl:
                    "https://www.shutterstock.com/image-photo/red-apple-isolated-on-white-600nw-1727544364.jpg",
                height: size.height * 0.12,
                width: size.height * 0.12,
                boxFit: BoxFit.fill,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Title",
                      color: color,
                      fontSize: 22,
                      isTitle: true,
                    ),
                    const HeartButton(),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PriceWidget(
                      price: 10.99,
                      salePrice: 8.99,
                      textPrice: _controller.text,
                      isSale: true,
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Row(
                        children: [
                          FittedBox(
                            child: TextWidget(
                              text: "KG",
                              color: color,
                              fontSize: 18,
                              isTitle: true,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                            child: TextFormField(
                              controller: _controller,
                              focusNode: _focusNode,
                              key: const ValueKey("10"),
                              style: TextStyle(color: color, fontSize: 18),
                              maxLines: 1,
                              enabled: true,
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  _controller.text = "1";
                                }
                                setState(() {
                                  _controller.text = value;
                                });
                              },
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                //signed: true,
                                decimal: true,
                              ),
                              //keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9.]'),
                                ),
                              ],
                              onTapOutside: (event) {
                                _focusNode.unfocus();
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).cardColor,
                  ),
                ),
                child: TextWidget(
                  text: "Add to cart",
                  color: color,
                  fontSize: 18,
                  maxLines: 1,
                  isTitle: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
