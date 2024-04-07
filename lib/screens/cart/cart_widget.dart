import 'package:e_commerce/services/utils.dart';
import 'package:e_commerce/widgets/heart_widget.dart';
import 'package:e_commerce/widgets/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    _controller.text = "1";
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                height: size.width * 0.25,
                width: size.width * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FancyShimmerImage(
                  imageUrl:
                      "https://img.freepik.com/free-psd/red-fresh-apple-isolated-con-transparent-background_125540-5172.jpg",
                  height: size.height * 0.12,
                  width: size.height * 0.12,
                  boxFit: BoxFit.fill,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextWidget(
                      text: "Title",
                      color: color,
                      fontSize: 18,
                      isTitle: true,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.4,
                    //height: size.height * 0.06,
                    child: Row(
                      children: [
                        _buyWidget(
                          color: Colors.red,
                          icon: Icons.exposure_minus_1_outlined,
                          fct: () {},
                        ),
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            controller: _controller,
                            focusNode: _focusNode,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp('[0-9.]'),
                              ),
                            ],
                            //maxLength: 10,
                            maxLines: 1,
                            //textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _controller.text = "0.1";
                              }
                            },
                            onTapOutside: (event) {
                              _focusNode.unfocus();
                            },
                          ),
                        ),
                        _buyWidget(
                          color: Colors.green,
                          icon: Icons.plus_one,
                          fct: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        IconlyBold.category,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const HeartButton(),
                    TextWidget(
                      color: color,
                      text: "Total \$",
                      fontSize: 18,
                      isTitle: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buyWidget(
      {required Color color, required IconData icon, required Function fct}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            fct();
          },
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(icon, color: Colors.white, size: 18),
          ),
        ),
      ),
    );
  }
}
