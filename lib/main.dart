import 'package:flutter/material.dart';
import 'package:union_shop/src/pages/about_us_page.dart';
import 'package:union_shop/src/pages/home_page.dart';
import 'package:union_shop/src/pages/product_page.dart';
import 'package:union_shop/src/pages/collections_page.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Union Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutUsPage(),
        '/collections': (context) => const CollectionsPage(),
      },
    );
  }
}