import 'package:flutter/material.dart';
import 'package:union_shop/src/pages/about_us_page.dart';
import 'package:union_shop/src/pages/home_page.dart';
import 'package:union_shop/src/pages/product_page.dart';
import 'package:union_shop/src/pages/collections_page.dart';
import 'package:union_shop/src/pages/collection_detail_page.dart';
import 'package:union_shop/src/pages/sale_collection_page.dart';
import 'package:union_shop/src/pages/auth_page.dart';
import 'package:union_shop/src/pages/all_products_page.dart';

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
        '/collection-detail': (context) => const CollectionDetailPage(),
        '/sale-collection': (context) => const SaleCollectionPage(),
        '/auth': (context) => const AuthPage(),
        '/all-products': (context) => const AllProductsPage(),
      },
    );
  }
}
