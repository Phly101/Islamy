
import 'package:flutter/material.dart';

class MyThemeData{
   static const Color lightMainFontColor = Color(0xFFB7935F);
   static const Color darkPrimary = Color(0xff141A2E);
   static const Color darkMainFontColor  = Color(0xffFACC1D);
   static const Color onDarkSecondary = Color(0xff0F1424);
  static ThemeData lightTheme = ThemeData(
    bottomSheetTheme:const BottomSheetThemeData(
      backgroundColor: Colors.white,
    ),



    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        fontFamily: 'Messiri',
        color: Colors.black,
      ),

      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 30,
        fontFamily: 'Messiri',
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontFamily: 'Inter',
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 25,
        fontFamily: 'Inter',
        color: Colors.black,
      ),
    ),
      cardTheme: const CardTheme(
        color: Colors.white,
        surfaceTintColor: null,

      ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
     selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      backgroundColor: lightMainFontColor,

    ),
    scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFF242424)),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB7935F),
        primary: const Color(0xFFB7935F),
        onPrimary: Colors.white,
        secondary: const Color(0xFFB7935F),
        onSecondary: Colors.black,
      )
  );

   static ThemeData darkTheme = ThemeData(
       bottomSheetTheme:const BottomSheetThemeData(
         backgroundColor: darkPrimary,
       ),

       textTheme: const TextTheme(
         titleMedium: TextStyle(
           fontWeight: FontWeight.bold,
           fontSize: 25,
           fontFamily: 'Messiri',
           color: darkMainFontColor,
         ),

         titleSmall: TextStyle(
           fontWeight: FontWeight.w500,
           fontSize: 25,
           fontFamily: 'Messiri',
           color: darkMainFontColor,
         ),

         bodyMedium: TextStyle(
           fontWeight: FontWeight.w500,
           fontSize: 20,
           fontFamily: 'Inter',
           color: darkMainFontColor,
         ),

       ),

     cardTheme: const CardTheme(
       color: onDarkSecondary,
       surfaceTintColor: null,

     ),
       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
         selectedItemColor: darkMainFontColor,
         unselectedItemColor: Colors.white,
         backgroundColor: darkPrimary,

       ),
       scaffoldBackgroundColor: Colors.transparent,
       appBarTheme: const AppBarTheme(
         iconTheme: IconThemeData(color: Colors.white),
         centerTitle: true,
         backgroundColor: Colors.transparent,
         titleTextStyle: TextStyle(
             fontSize: 30,
             fontWeight: FontWeight.bold,
             color: Colors.white),
       ),
       colorScheme: ColorScheme.fromSeed(seedColor: darkPrimary,
         primary: darkPrimary,
         onPrimary: Colors.white,
         secondary: darkMainFontColor,
         onSecondary: Colors.black,
       )
   );
}