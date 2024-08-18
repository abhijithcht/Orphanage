import 'package:flutter/material.dart';
import 'package:hope_orphanage/auth/login_admin.dart';
import 'package:hope_orphanage/auth/login_user.dart';
import 'package:hope_orphanage/auth/register_admin.dart';
import 'package:hope_orphanage/auth/register_user.dart';
import 'package:hope_orphanage/pages/cart/view_cart.dart';
import 'package:hope_orphanage/pages/craft/add_item_admin.dart';
import 'package:hope_orphanage/pages/craft/delete_item_admin.dart';
import 'package:hope_orphanage/pages/craft/view_craft_admin.dart';
import 'package:hope_orphanage/pages/craft/view_craft_user.dart';
import 'package:hope_orphanage/pages/donation/add_donation.dart';
import 'package:hope_orphanage/pages/donation/view_donation.dart';
import 'package:hope_orphanage/pages/events/add_events_admin.dart';
import 'package:hope_orphanage/pages/events/add_events_user.dart';
import 'package:hope_orphanage/pages/events/delete_events_admin.dart';
import 'package:hope_orphanage/pages/events/delete_events_user.dart';
import 'package:hope_orphanage/pages/events/view_events_admin.dart';
import 'package:hope_orphanage/pages/events/view_events_user.dart';
import 'package:hope_orphanage/pages/food_donation/add_food_donation.dart';
import 'package:hope_orphanage/pages/food_donation/cancel_food_bookings_admin.dart';
import 'package:hope_orphanage/pages/food_donation/cancel_food_bookings_user.dart';
import 'package:hope_orphanage/pages/food_donation/view_food_bookings.dart';
import 'package:hope_orphanage/pages/home/choice_screen.dart';
import 'package:hope_orphanage/pages/home/home_admin.dart';
import 'package:hope_orphanage/pages/home/home_user.dart';
import 'package:hope_orphanage/widgets/page_transition.dart';
import 'package:hope_orphanage/widgets/splash_admin.dart';
import 'package:hope_orphanage/widgets/splash_user.dart';

var iPAddress = "192.168.29.115";
var uidUser = '';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // user == 1
  // admin == 2

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
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
      ),
      debugShowCheckedModeBanner: false,
      home: const ChoiceScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/splash1':
            return buildPageTransition(const SplashUser());
          case '/splash2':
            return buildPageTransition(const SplashAdmin());
          case '/home1':
            return buildPageTransition(const HomeUser());
          case '/home2':
            return buildPageTransition(const HomeAdmin());
          case '/choice':
            return buildPageTransition(const ChoiceScreen());
          case '/login1':
            return buildPageTransition(const LoginUser());
          case '/login2':
            return buildPageTransition(const LoginAdmin());
          case '/register1':
            return buildPageTransition(const RegisterUser());
          case '/register2':
            return buildPageTransition(const RegisterAdmin());
          case '/add-craft':
            return buildPageTransition(const CraftAdd());
          case '/delete-craft':
            return buildPageTransition(const CraftDelete());
          case '/add-event':
            return buildPageTransition(const EventAdd());
          case '/delete-event':
            return buildPageTransition(const EventView1());
          case '/food-cancel':
            return buildPageTransition(const FoodCancel());
          case '/donate':
            return buildPageTransition(const DonationAdd());
          case '/view-donate':
            return buildPageTransition(const DonationView());
          case '/food':
            return buildPageTransition(const FoodDonation());
          case '/food-view':
            return buildPageTransition(const FoodView());
          case '/reg-event':
            return buildPageTransition(const EventRegister());
          case '/user-event':
            return buildPageTransition(const EventViewUser());
          case '/view-event':
            return buildPageTransition(const EventView2());
          case '/delete-userevent':
            return buildPageTransition(const EventDeleteUser());
          case '/food-usercancel':
            return buildPageTransition(const FoodUserCancel());
          case '/craft1':
            return buildPageTransition(const CraftShop());
          case '/craft2':
            return buildPageTransition(const CraftShopAdmin());
          case '/cart':
            return buildPageTransition(const ViewCart());
          default:
            return null;
        }
      },
    );
  }
}
