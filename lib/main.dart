import 'package:flutter/material.dart';
import 'package:islamy/UI/Providers/lang_provider.dart';
import 'package:islamy/UI/Providers/theme_provider.dart';
import 'package:islamy/UI/chapter_details/chapter_details.dart';
import 'package:islamy/UI/hadeth_details/hadeth_details.dart';
import 'package:islamy/UI/home/main_screen/home_screen.dart';
import 'package:islamy/theme/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPreferences = await SharedPreferences.getInstance();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider( sharedPreferences)),
      ChangeNotifierProvider(create: (_) =>LangProvider(sharedPreferences)),
    ],

      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LangProvider langProvider = Provider.of<LangProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        ChapterDetails.routeName: (_) => const ChapterDetails(),
        HadethDetails.routeName: (_) => const HadethDetails(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: themeProvider.currentTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(langProvider.currentLocale)
    );
  }
}
