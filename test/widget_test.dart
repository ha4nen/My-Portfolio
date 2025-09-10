// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:myportfolio/main.dart';

void main() {
  testWidgets('Portfolio app renders main sections', (WidgetTester tester) async {
    await tester.pumpWidget(const MyPortfolioApp());

    // AppBar title present
    expect(find.text('Hanin AbuHasirah'), findsWidgets);

    // Sections render
    expect(find.text('About Me'), findsWidgets);
    expect(find.text('Skills & Expertise'), findsWidgets);
    expect(find.text('Featured Projects'), findsWidgets);
    expect(find.text("Let's Connect"), findsWidgets);
  });
}
