import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.black,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      weight: 800,
      size: 30,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 0,
    foregroundColor: Colors.black,
    backgroundColor: Colors.blue,
    iconSize: 40,
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.grey[200],
    elevation: 0,
  ),
  tabBarTheme: TabBarTheme(
    indicatorColor: Colors.white,
    labelColor: Colors.white,
    unselectedLabelColor: Colors.black,
    splashFactory: NoSplash.splashFactory,
    overlayColor: WidgetStateProperty.all(Colors.transparent),
  ),
  primaryColor: Colors.indigoAccent,
  cardTheme: CardTheme(
    color: Colors.blue[100],
    clipBehavior: Clip.antiAlias,
    margin: const EdgeInsets.symmetric(vertical: 10),
  ),
  listTileTheme: const ListTileThemeData(
    visualDensity: VisualDensity.compact,
    horizontalTitleGap: 40,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
    subtitleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 16,
      height: 2,
      overflow: TextOverflow.ellipsis,
    ),
    leadingAndTrailingTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 16,
      overflow: TextOverflow.ellipsis,
    ),
  ),
  navigationBarTheme: NavigationBarThemeData(
    indicatorColor: Colors.blue,
    backgroundColor: Colors.grey[200],
  ),
);
