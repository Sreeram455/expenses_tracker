import 'package:flutter/material.dart';
import 'package:expenses_tracker/expenses.dart';
var kcolorScheme=ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var kdarkcolorscheme=ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 99, 125),brightness: Brightness.dark);
void main(){
  runApp(MaterialApp(
    darkTheme: ThemeData().copyWith(useMaterial3: true,colorScheme: kdarkcolorscheme,
        cardTheme: const CardTheme().copyWith(color: kdarkcolorscheme.secondaryContainer,margin:
        const EdgeInsets.symmetric(horizontal: 16,vertical: 8)),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
            backgroundColor: kdarkcolorscheme.primaryContainer,
        foregroundColor: kdarkcolorscheme.onPrimaryContainer))),


  theme:ThemeData().copyWith(useMaterial3: true,colorScheme: kcolorScheme,
  appBarTheme: const AppBarTheme().copyWith(backgroundColor: kcolorScheme.onPrimaryContainer,
  foregroundColor:kcolorScheme.onPrimary),
  cardTheme: const CardTheme().copyWith(color: kcolorScheme.secondaryContainer,margin:
      const EdgeInsets.symmetric(horizontal: 16,vertical: 8)),
  elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: kcolorScheme.onPrimaryContainer)),
  textTheme: ThemeData().textTheme.copyWith(titleLarge: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,
      color: kcolorScheme.onSecondaryContainer))),

themeMode: ThemeMode.system,//it is by default present
    home:const Expenses()
  )
  );
}