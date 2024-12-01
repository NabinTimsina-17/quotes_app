import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/view/home_page.dart';
import 'package:quotes_app/view_model/home_view_model.dart';

void main() {
  testWidgets('HomePage shows grid items and navigates to DetailsPage', (WidgetTester tester) async {
    // Provide the HomeViewModel using ChangeNotifierProvider.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: const MaterialApp(
          home: HomePage(),
        ),
      ),
    );

    // Verify that HomePage is loaded and grid items are present.
    expect(find.text('Alone'), findsOneWidget);
    expect(find.text('Angry'), findsOneWidget);
    expect(find.text('Anniversary'), findsOneWidget);

    // Tap on the grid item 'Alone'.
    await tester.tap(find.text('Alone'));
    await tester.pumpAndSettle();

    // Verify navigation to DetailsPage and its content.
    expect(find.text('Alone'), findsOneWidget);
    expect(find.text('You are never alone.'), findsOneWidget);
    expect(find.text('Being alone is a strength.'), findsOneWidget);
    expect(find.text('Solitude is peace.'), findsOneWidget);
  });
}
