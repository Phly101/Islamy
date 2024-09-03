import 'package:flutter/material.dart';
import 'package:islamy/UI/home/main_screen/button_nav.dart';
import 'package:islamy/UI/home/quaran/quran_tab.dart';
import 'package:islamy/UI/home/radio/radio_tab.dart';
import 'package:islamy/UI/home/sebha/sebha_tab.dart';
import 'package:islamy/UI/home/hadeth/hadeth_tab.dart';
import 'package:islamy/UI/home/settings/settings_tab.dart';
import 'package:islamy/default_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
        body:
    Scaffold(
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.appTitle,
        style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        items: [
          ButtonNav(AppLocalizations.of(context)!.quranTab,iconPath:  "assets/icons/1x/quran.png",Theme.of(context).primaryColor ),
          ButtonNav(AppLocalizations.of(context)!.hadethTab,iconPath:  "assets/icons/1x/hadeth.png",Theme.of(context).primaryColor),
          ButtonNav(AppLocalizations.of(context)!.sebhaTab,iconPath:  "assets/icons/1x/sebha.png",Theme.of(context).primaryColor),
          ButtonNav(AppLocalizations.of(context)!.radioTab,iconPath:  "assets/icons/1x/radio.png",Theme.of(context).primaryColor),
          ButtonNav(AppLocalizations.of(context)!.settings,mainIcon:  const Icon(Icons.settings),Theme.of(context).primaryColor),
        ],
      ),
    ),

    );
  }
}

var tabs = [
  const QuranTab(),
  HadethTab(),
  const SebhaTab(),
  const RadioTab(),
  const SettingsTab(),
];
