import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_2/main.dart';

void main() {
  group('LogoSlider Widget Tests', () {
    testWidgets('Initial logo size is 50', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LogoSlider()));
      final logoFinder = find.byType(FlutterLogo);
      final logo = tester.widget<FlutterLogo>(logoFinder);
      expect(logo.size, 50);
    });

    testWidgets('Slider min and max values are correct', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LogoSlider()));
      final sliderFinder = find.byType(Slider);
      final slider = tester.widget<Slider>(sliderFinder);
      expect(slider.min, 50);
      expect(slider.max, 200);
    });

    testWidgets('Slider updates logo size', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LogoSlider()));
      final sliderFinder = find.byType(Slider);
      await tester.drag(sliderFinder, const Offset(100, 0));
      await tester.pump();
      final logoFinder = find.byType(FlutterLogo);
      final logo = tester.widget<FlutterLogo>(logoFinder);
      expect(logo.size, greaterThan(50));
    });
  });

  group('Box Widget Tests', () {
    testWidgets('Initial count is displayed correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Box(count: 5, onPressed: (value) {}),
        ),
      ));
      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('Button press triggers onPressed with value 2', (WidgetTester tester) async {
      int pressedValue = 0;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Box(
            count: 0,
            onPressed: (value) => pressedValue = value,
          ),
        ),
      ));
      await tester.tap(find.text('+2'));
      await tester.pump();
      expect(pressedValue, 2);
    });
  });
}
