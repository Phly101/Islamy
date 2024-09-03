import 'package:flutter/material.dart';
import 'package:islamy/UI/Providers/theme_provider.dart';
import 'package:provider/provider.dart';

class DefaultScreen extends StatelessWidget {
  Widget body;

   DefaultScreen({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    bool isDark = provider.isDarkEnabled();
    return Stack(
      children: [

        Image.asset(

         isDark? "assets/images/darkmode_background.png" : "assets/images/Main.png",
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        body
      ],
    );

  }

}
