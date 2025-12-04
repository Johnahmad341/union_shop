import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:union_shop/src/widgets/footer.dart';

void main() {
  group('UnionFooter Widget', () {
    testWidgets('Footer displays copyright text', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UnionFooter(),
          ),
        ),
      );

      // Assert
      expect(find.text('© 2024, Union Shop'), findsOneWidget);
    });

    testWidgets('Footer displays all section headers',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UnionFooter(),
          ),
        ),
      );

      // Assert
      expect(find.text('SHOP'), findsOneWidget);
      expect(find.text('INFORMATION'), findsOneWidget);
      expect(find.text('OPENING HOURS'), findsOneWidget);
    });

    testWidgets('Footer displays opening hours correctly',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UnionFooter(),
          ),
        ),
      );

      // Assert
      expect(find.text('Mon - Fri: 9am - 5pm'), findsOneWidget);
      expect(find.text('Saturday: 10am - 4pm'), findsOneWidget);
      expect(find.text('Sunday: Closed'), findsOneWidget);
    });

    testWidgets('Footer contains navigation links',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UnionFooter(),
          ),
        ),
      );

      // Assert
      expect(find.text('All Products'), findsOneWidget);
      expect(find.text('Collections'), findsOneWidget);
      expect(find.text('About Us'), findsOneWidget);
      expect(find.text('Contact Us'), findsOneWidget);
      expect(find.text('FAQs'), findsOneWidget);
    });

    testWidgets('Contact Us link navigates to contact page',
        (WidgetTester tester) async {
      // Arrange
      bool navigated = false;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: UnionFooter(),
          ),
          routes: {
            '/contact': (context) {
              navigated = true;
              return const Scaffold(
                body: Center(child: Text('Contact Page')),
              );
            },
          },
        ),
      );

      // Find and tap the Contact Us link
      await tester.tap(find.text('Contact Us'));
      await tester.pumpAndSettle();

      // Assert
      expect(navigated, true);
      expect(find.text('Contact Page'), findsOneWidget);
    });

    testWidgets('Footer displays payment method icons',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UnionFooter(),
          ),
        ),
      );

      // Assert - Check for icon widgets (payment icons)
      // We expect to find multiple FaIcon widgets for payment methods
      expect(find.byType(FaIcon), findsWidgets);
    });

    testWidgets('About Us link navigates correctly',
        (WidgetTester tester) async {
      // Arrange
      bool navigatedToAbout = false;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: UnionFooter(),
          ),
          routes: {
            '/about': (context) {
              navigatedToAbout = true;
              return const Scaffold(
                body: Center(child: Text('About Page')),
              );
            },
          },
        ),
      );

      // Find and tap the About Us link
      await tester.tap(find.text('About Us'));
      await tester.pumpAndSettle();

      // Assert
      expect(navigatedToAbout, true);
    });

    testWidgets('Collections link navigates correctly',
        (WidgetTester tester) async {
      // Arrange
      bool navigatedToCollections = false;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: UnionFooter(),
          ),
          routes: {
            '/collections': (context) {
              navigatedToCollections = true;
              return const Scaffold(
                body: Center(child: Text('Collections Page')),
              );
            },
          },
        ),
      );

      // Find and tap the Collections link
      await tester.tap(find.text('Collections'));
      await tester.pumpAndSettle();

      // Assert
      expect(navigatedToCollections, true);
    });

    testWidgets('All Products link navigates correctly',
        (WidgetTester tester) async {
      // Arrange
      bool navigatedToAllProducts = false;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: UnionFooter(),
          ),
          routes: {
            '/all-products': (context) {
              navigatedToAllProducts = true;
              return const Scaffold(
                body: Center(child: Text('All Products Page')),
              );
            },
          },
        ),
      );

      // Find and tap the All Products link
      await tester.tap(find.text('All Products'));
      await tester.pumpAndSettle();

      // Assert
      expect(navigatedToAllProducts, true);
    });
  });
}
