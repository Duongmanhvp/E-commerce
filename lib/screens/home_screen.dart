// ignore_for_file: unused_local_variable

import 'package:card_swiper/card_swiper.dart';
import 'package:e_commerce/inner_screens/on_sale_screen.dart';
import 'package:e_commerce/inner_screens/all_product.dart';
import 'package:e_commerce/services/global_methods.dart';
import 'package:e_commerce/services/utils.dart';
import 'package:e_commerce/widgets/feed_widget.dart';
import 'package:e_commerce/widgets/sale_widget.dart';
import 'package:e_commerce/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offerImages = [
    'assets/images/offers/Offer1.jpg',
    'assets/images/offers/Offer2.jpg',
    'assets/images/offers/Offer3.jpg',
    'assets/images/offers/Offer4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final themeState = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    //GlobalMethods globalMethods = GlobalMethods();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.333,
                child: Swiper(
                  itemBuilder: (context, index) {
                    return Image.asset(
                      _offerImages[index],
                      fit: BoxFit.fill,
                    );
                  },
                  indicatorLayout: PageIndicatorLayout.COLOR,
                  autoplay: true,
                  itemCount: _offerImages.length,
                  pagination: const SwiperPagination(),
                  control: const SwiperControl(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: () {
                  GlobalMethods.navigateTo(
                      context: context, routeName: OnSaleScreen.routeName);
                },
                child: TextWidget(
                  text: "View all",
                  color: Colors.blue,
                  fontSize: 18,
                  maxLines: 1,
                ),
              ),
              Row(
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.discount,
                          color: Colors.red,
                        ),
                        TextWidget(
                          text: " On sale".toUpperCase(),
                          color: Colors.red,
                          fontSize: 20,
                          isTitle: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Flexible(
                    child: SizedBox(
                      height: size.height * 0.23,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const SaleWidget();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    TextWidget(
                      text: "Our products",
                      color: color,
                      fontSize: 18,
                      isTitle: true,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        GlobalMethods.navigateTo(
                            context: context,
                            routeName: AllProductWidget.routeProfileName);
                      },
                      child: TextWidget(
                        text: "Browser all",
                        color: Colors.blue,
                        fontSize: 18,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                //crossAxisSpacing: 10,
                padding: EdgeInsets.zero,
                childAspectRatio: size.width / (size.height * 0.6),
                children: List.generate(
                  4,
                  (index) {
                    return const FeedsWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
