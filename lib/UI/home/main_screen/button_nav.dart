import 'package:flutter/material.dart';


class ButtonNav extends BottomNavigationBarItem {
  ButtonNav(
    String title,
    Color backgroundColor,
  {
  String? iconPath,

  Icon? mainIcon,
  }
  ) : super(icon:
  mainIcon ?? ImageIcon(AssetImage(iconPath!)),
  label: title,
    backgroundColor: backgroundColor,
  );
}
