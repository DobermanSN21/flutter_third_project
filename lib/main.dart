import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/shop.dart';
import 'package:flutter_application_3/pages/cart_page.dart';
import 'package:provider/provider.dart';
import './pages/front_page.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FrontPage(),
      routes: {
        'frontpage': (context) => const FrontPage(),
        'menupage': (context) => const MenuPage(),
        'cartpage': (context) => const CartPage(),
      },
    );
  }
}
