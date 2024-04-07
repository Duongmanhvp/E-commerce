// ignore_for_file: unused_element
import 'package:e_commerce/inner_screens/all_product.dart';
import 'package:e_commerce/provider/dark_theme_provider.dart';
import 'package:e_commerce/services/global_methods.dart';
import 'package:e_commerce/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController = TextEditingController();

  @override
  void initState() {
    _addressTextController.text = "Your profile";
    super.initState();
  }

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Hi,',
                  style: TextStyle(
                    fontSize: 30,
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                color: color,
                thickness: 0.8,
              ),
              const SizedBox(
                height: 10,
              ),
              buildListTile(
                title: 'Profile',
                subtitle: 'Edit your profile',
                icon: IconlyBold.profile,
                onPressed: () {},
                color: color,
              ),
              buildListTile(
                title: 'Orders',
                icon: IconlyBold.buy,
                onPressed: () {},
                color: color,
              ),
              buildListTile(
                title: 'Forget my password',
                icon: IconlyBold.unlock,
                onPressed: () {},
                color: color,
              ),
              buildListTile(
                title: 'Log out',
                icon: IconlyBold.logout,
                onPressed: () {
                  //Navigator.of(context).pop(showLogoutDialog());
                  //showLogoutDialog();
                },
                color: color,
              ),
              SwitchListTile(
                title: TextWidget(
                  text: "Theme",
                  color: color,
                  fontSize: 18,
                  isTitle: true,
                ),
                subtitle:
                    TextWidget(text: "Dark Mode", color: color, fontSize: 16),
                secondary: Icon(themeState.getDarkTheme
                    ? Icons.nightlight_round
                    : Icons.wb_sunny_outlined),
                onChanged: (bool value) {
                  themeState.setDarkTheme = value;
                },
                value: themeState.getDarkTheme,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        fontSize: 18,
        color: color,
        isTitle: true,
      ),
      subtitle: TextWidget(
        text: subtitle ?? '',
        color: color,
        fontSize: 16,
      ),
      leading: Icon(icon),
      isThreeLine: false,
      dense: true,
      trailing: const Icon(IconlyBold.arrowRightCircle),
      selected: false,
      enabled: true,
      onLongPress: () => (),
      onTap: onPressed(),
    );
  }
}
