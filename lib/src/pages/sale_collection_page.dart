import 'package:flutter/material.dart';
import 'package:union_shop/src/widgets/app_bar.dart';
import 'package:union_shop/src/widgets/footer.dart';

class SaleCollectionPage extends StatelessWidget {
  const SaleCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: UnionAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'Sale Items',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Grab a bargain with our selection of sale items. Limited stock available!',
                    style: TextStyle(
                        fontSize: 16, height: 1.5, color: Colors.black54),
                  ),
                  SizedBox(height: 32),
                  // Product grid will go here in a future step
                  Center(
                    child: Text('Products will be displayed here soon.'),
                  )
                ],
              ),
            ),
            UnionFooter(),
          ],
        ),
      ),
    );
  }
}
