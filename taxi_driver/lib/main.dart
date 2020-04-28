import 'package:flutter/material.dart';
import 'package:taxidriver/ui/account.dart';
import 'package:taxidriver/ui/earnings.dart';
import 'package:taxidriver/ui/earnings_details.dart';
import 'package:taxidriver/ui/home.dart';
import 'package:taxidriver/ui/notifications.dart';
import 'package:taxidriver/ui/profile.dart';
import 'package:taxidriver/ui/promotions.dart';
import 'package:taxidriver/ui/recent_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taxi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Taxi'),
        '/notifications': (context) => NotificationsPage(),
        '/earnings': (context) => EarningsPage(),
        '/profile': (context) => ProfilePage(),
        '/earning_details': (context) => EarningsDetailPage(),
        '/recent_transations': (context) => RecentTransactionsPage(),
        '/promotions': (context) => PromotionsPage(),
        '/account': (context) => AccountPage(),
      },
    );
  }
}
