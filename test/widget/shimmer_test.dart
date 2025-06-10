import 'package:flutter/material.dart';
import 'package:flutter_template/widget/shimmer.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/wrap_for_testing.dart';

void main() {
  group('Shimmer Widget', () {
    testWidgets('ShimmerLoading', (tester) async {
      await tester.pumpWidget(
        wrapForTesting(
          child: Shimmer(
            linearGradient: const LinearGradient(
              colors: [Colors.red, Colors.blue],
            ),
            child: ShimmerLoading(isLoading: true, child: const Text('Test')),
          ),
        ),
      );

      expect(find.text('Test'), findsNothing);
    });

    testWidgets('ShimmerNotLoading', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Shimmer(
            linearGradient: const LinearGradient(
              colors: [Colors.red, Colors.blue],
            ),
            child: ShimmerLoading(isLoading: false, child: const Text('Test')),
          ),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
    });
  });
}
