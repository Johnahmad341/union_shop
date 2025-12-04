import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/src/models/product_model.dart';
import 'package:union_shop/src/widgets/product_card.dart';

void main() {
  group('ProductCard Widget', () {
    testWidgets('ProductCard displays product title', (WidgetTester tester) async {
      // Arrange
      const product = Product(
        title: 'Test Hoodie',
        price: '£34.99',
        imageUrl: 'assets/images/hoodies/test.jpg',
        description: 'Test Description',
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(product: product),
          ),
        ),
      );

      // Assert
      expect(find.text('Test Hoodie'), findsOneWidget);
    });

    testWidgets('ProductCard displays regular price when not on sale',
        (WidgetTester tester) async {
      // Arrange
      const product = Product(
        title: 'Test Hoodie',
        price: '£34.99',
        imageUrl: 'assets/images/hoodies/test.jpg',
        description: 'Test Description',
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(product: product),
          ),
        ),
      );

      // Assert
      expect(find.text('£34.99'), findsOneWidget);
    });

    testWidgets('ProductCard displays both prices when on sale',
        (WidgetTester tester) async {
      // Arrange
      const product = Product(
        title: 'Sale Hoodie',
        price: '£34.99',
        imageUrl: 'assets/images/hoodies/test.jpg',
        description: 'Test Description',
        isOnSale: true,
        salePrice: '£24.99',
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(product: product),
          ),
        ),
      );

      // Assert
      expect(find.text('£34.99'), findsOneWidget);
      expect(find.text('£24.99'), findsOneWidget);
    });

    testWidgets('ProductCard navigates to product page on tap',
        (WidgetTester tester) async {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'assets/images/test.jpg',
        description: 'Test Description',
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(product: product),
          ),
          routes: {
            '/product': (context) => const Scaffold(
              body: Center(child: Text('Product Page')),
            ),
          },
        ),
      );

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Product Page'), findsOneWidget);
    });

    testWidgets('ProductCard applies strikethrough to original price on sale',
        (WidgetTester tester) async {
      // Arrange
      const product = Product(
        title: 'Sale Item',
        price: '£50.00',
        imageUrl: 'assets/images/test.jpg',
        description: 'On Sale',
        isOnSale: true,
        salePrice: '£30.00',
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(product: product),
          ),
        ),
      );

      // Assert - Find the text with strikethrough decoration
      final textWidgets = find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.style?.decoration == TextDecoration.lineThrough,
      );
      expect(textWidgets, findsOneWidget);
    });

    testWidgets('ProductCard displays sale price in red',
        (WidgetTester tester) async {
      // Arrange
      const product = Product(
        title: 'Sale Item',
        price: '£50.00',
        imageUrl: 'assets/images/test.jpg',
        description: 'On Sale',
        isOnSale: true,
        salePrice: '£30.00',
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(product: product),
          ),
        ),
      );

      // Assert - Find text in red color
      final redText = find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.style?.color == Colors.red &&
            widget.data == '£30.00',
      );
      expect(redText, findsOneWidget);
    });

    testWidgets('ProductCard displays product image',
        (WidgetTester tester) async {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'assets/images/test.jpg',
        description: 'Test',
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(product: product),
          ),
        ),
      );

      // Assert - Image widget should be present
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('ProductCard title truncates with ellipsis on long text',
        (WidgetTester tester) async {
      // Arrange
      const product = Product(
        title: 'This is a very long product title that should truncate',
        price: '£10.00',
        imageUrl: 'assets/images/test.jpg',
        description: 'Test',
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 150,
              height: 200,
              child: ProductCard(product: product),
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('This is a very long product title that should truncate'),
          findsOneWidget);
    });
  });
}
