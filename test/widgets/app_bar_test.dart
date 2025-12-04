import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/src/widgets/app_bar.dart';

void main() {
  group('UnionAppBar Widget', () {
    testWidgets('AppBar renders without errors', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: UnionAppBar(),
            body: Center(child: Text('Test')),
          ),
        ),
      );

      // Assert
      expect(find.byType(UnionAppBar), findsOneWidget);
    });

    testWidgets('AppBar has correct preferred size',
        (WidgetTester tester) async {
      // Arrange
      const appBar = UnionAppBar();

      // Assert
      expect(appBar.preferredSize, equals(const Size.fromHeight(150)));
    });

    testWidgets('AppBar is a StatefulWidget', (WidgetTester tester) async {
      // Assert
      expect(UnionAppBar(), isA<StatefulWidget>());
    });

    testWidgets('AppBar implements PreferredSizeWidget',
        (WidgetTester tester) async {
      // Assert
      expect(UnionAppBar(), isA<PreferredSizeWidget>());
    });

    testWidgets('AppBar displays container widgets',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: UnionAppBar(),
            body: Center(child: Text('Test')),
          ),
        ),
      );

      // Assert
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('AppBar displays columns', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: UnionAppBar(),
            body: Center(child: Text('Test')),
          ),
        ),
      );

      // Assert
      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('AppBar displays rows', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: UnionAppBar(),
            body: Center(child: Text('Test')),
          ),
        ),
      );

      // Assert
      expect(find.byType(Row), findsWidgets);
    });

    testWidgets('AppBar displays text', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: UnionAppBar(),
            body: Center(child: Text('Test')),
          ),
        ),
      );

      // Assert
      expect(find.byType(Text), findsWidgets);
    });

    testWidgets('AppBar displays icons', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: UnionAppBar(),
            body: Center(child: Text('Test')),
          ),
        ),
      );

      // Assert
      expect(find.byType(Icon), findsWidgets);
    });

    testWidgets('AppBar has cart icon', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: UnionAppBar(),
            body: Center(child: Text('Test')),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
    });

    testWidgets('AppBar renders without throwing error',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: UnionAppBar(),
            body: Center(child: Text('Test')),
          ),
        ),
      );

      // Assert
      expect(find.byType(UnionAppBar), findsOneWidget);
    });

    testWidgets('AppBar renders on desktop size', (WidgetTester tester) async {
      // Arrange
      tester.binding.window.physicalSizeTestValue = const Size(1200, 800);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: UnionAppBar(),
            body: Center(child: Text('Test')),
          ),
        ),
      );

      // Assert
      expect(find.byType(UnionAppBar), findsOneWidget);
    });

    testWidgets('AppBar contains search icon', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: UnionAppBar(),
            body: Center(child: Text('Test')),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('AppBar builds successfully', (WidgetTester tester) async {
      // Act
      final widget = UnionAppBar();

      // Assert
      expect(widget, isNotNull);
      expect(widget.key, isNull);
    });
  });
}
