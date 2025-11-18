import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_2/main.dart';

void main() {
  group('LogoSlider Widget Tests', () {
    testWidgets('should render FlutterLogo with initial size', (WidgetTester tester) async {
      double logoSize = 50;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LogoSlider(
              logoSize: logoSize,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      expect(find.byType(FlutterLogo), findsOneWidget);
      final FlutterLogo logo = tester.widget(find.byType(FlutterLogo));
      expect(logo.size, equals(logoSize));
    });

    testWidgets('should update logo size when slider is moved', (WidgetTester tester) async {
      double logoSize = 50;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LogoSlider(
              logoSize: logoSize,
              onChanged: (value) {
                logoSize = value;
              },
            ),
          ),
        ),
      );

      await tester.drag(find.byType(Slider), const Offset(100, 0));
      await tester.pump();

      expect(logoSize, greaterThan(50));
      final FlutterLogo logo = tester.widget(find.byType(FlutterLogo));
      expect(logo.size, equals(logoSize));
    });

    testWidgets('should display correct label for logo size', (WidgetTester tester) async {
      double logoSize = 50;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LogoSlider(
              logoSize: logoSize,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      expect(find.text('Logo 大小: 50'), findsOneWidget);
    });
  });

  group('Box Widget Tests', () {
    testWidgets('should render with initial count', (WidgetTester tester) async {
      int count = 0;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Box(
              count: count,
              onPressed: (value) {},
            ),
          ),
        ),
      );

      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('should update count when button is pressed', (WidgetTester tester) async {
      int count = 0;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Box(
              count: count,
              onPressed: (value) {
                count += value;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('+2'));
      await tester.pump();

      expect(count, equals(2));
    });
  });

  group('MyHomePage Widget Tests', () {
    testWidgets('should increment count when button is pressed', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MyHomePage()));

      expect(find.text('0'), findsOneWidget);
      await tester.tap(find.text('+1'));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('should reset logo size to max when button is pressed', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MyHomePage()));

      await tester.tap(find.text('让图标变最大'));
      await tester.pump();

      final FlutterLogo logo = tester.widget(find.byType(FlutterLogo));
      expect(logo.size, equals(200));
    });
  });
}