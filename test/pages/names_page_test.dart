import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_counter_app/providers/names_provider.dart';
import 'package:riverpod_counter_app/pages/names_page.dart';

void main() {
  testWidgets('NamesPage displays names correctly', (tester) async {
    // Define a mock namesProvider that returns a list of names
    final namesProvider = Provider<List<String>>((ref) => ['John', 'Doe']);

    // Build the NamesPage widget with the mock namesProvider
    await tester.pumpWidget(
      MaterialApp(
        home: ProviderScope(
          overrides: [
            namesProvider.overrideWith((ref) => ['John', 'Doe']),
          ],
          child: const NamesPage(),
        ),
      ),
    );

    // Verify that the widget displays the correct names
    expect(find.text('John'), findsOneWidget);
    expect(find.text('Doe'), findsOneWidget);
  });

  testWidgets('NamesPage displays loading indicator', (tester) async {
    // Define a mock namesProvider that returns loading state
    final namesProvider = FutureProvider.autoDispose<List<String>>(
          (ref) => throw Error(),
      name: 'mockNamesProvider',
    );

    // Build the NamesPage widget with the mock namesProvider
    await tester.pumpWidget(
      MaterialApp(
        home: ProviderScope(
          overrides: [
            namesProvider.overrideWithProvider(
              FutureProvider.autoDispose<List<String>>((ref) async {
                await Future.delayed(const Duration(seconds: 1)); // Simulate async loading
                throw Error();
              }),
            ),
          ],
          child: const NamesPage(),
        ),
      ),
    );

    // Verify that the widget displays the loading indicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('NamesPage displays error message', (tester) async {
    // Define a mock namesProvider that returns an error state
    final namesProvider = FutureProvider.autoDispose<List<String>>(
          (ref) => throw Error(),
      name: 'mockNamesProvider',
    );

    // Build the NamesPage widget with the mock namesProvider
    await tester.pumpWidget(
      MaterialApp(
        home: ProviderScope(
          child: NamesPage(),
          overrides: [
            namesProvider.overrideWithProvider(
              FutureProvider.autoDispose<List<String>>((ref) async {
                await Future.delayed(const Duration(seconds: 1)); // Simulate async loading
                throw Error();
              }),
            ),
          ],
        ),
      ),
    );

    // Verify that the widget displays the error message
    expect(find.text('Reached the end of the list!'), findsOneWidget);
  });
}