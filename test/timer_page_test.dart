import 'package:flexify/plan_state.dart';
import 'package:flexify/settings_state.dart';
import 'package:flexify/timer_page.dart';
import 'package:flexify/timer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() async {
  await mockTests();

  testWidgets('TimerPage', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SettingsState()),
          ChangeNotifierProvider(create: (context) => TimerState()),
          ChangeNotifierProvider(create: (context) => PlanState()),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: TimerPage(),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('00:00'), findsOne);
    expect(find.text('+1 min'), findsOne);
  });
}
