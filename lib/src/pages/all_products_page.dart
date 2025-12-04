import 'package:flutter/material.dart';
import 'package:union_shop/src/models/product_model.dart';
import 'package:union_shop/src/repositories/product_repository.dart';
import 'package:union_shop/src/widgets/app_bar.dart';
import 'package:union_shop/src/widgets/footer.dart';
import 'package:union_shop/src/widgets/product_card.dart';

class AllProductsPage extends StatelessWidget {
  const AllProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = ProductRepository.getAllProducts();
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate number of columns based on screen width
    int crossAxisCount;
    if (screenWidth < 600) {
      crossAxisCount = 2; // Mobile
    } else if (screenWidth < 900) {
      crossAxisCount = 3; // Tablet
    } else if (screenWidth < 1200) {
      crossAxisCount = 4; // Small desktop
    } else {
      crossAxisCount = 5; // Large desktop
    }

    return Scaffold(
      appBar: const UnionAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'All Products',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
            const UnionFooter(),
          ],
        ),
      ),
    );
  }
}
