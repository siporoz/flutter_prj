import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: Color.fromARGB(255, 37, 37, 37),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
  dividerColor: Colors.white10,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 37, 37, 37),
    elevation: 0,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 18 , fontWeight: FontWeight.w700),
    iconTheme: IconThemeData(
      color: Colors.white
    ),
  ),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  useMaterial3: true,
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20
    ),
    labelSmall: TextStyle(
      color: Colors.white.withOpacity(0.6),
      fontWeight: FontWeight.w700,
      fontSize: 14
    )
  )
);