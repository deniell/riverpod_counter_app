import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter_app/main.dart';
import 'package:riverpod_counter_app/providers/auto_counter_provider.dart';

// ConsumerWidget is like a StatelessWidget
// but with a WidgetRef parameter added in the build method.
class AutoCounterPage extends ConsumerWidget {
  const AutoCounterPage({Key? key}) : super(key: key);
  final initValue = 1000;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Using the WidgetRef to get the counter int from the counterProvider.
    // The watch method makes the widget rebuild whenever the int changes value.
    //   - something like setState() but automatic
    final AsyncValue<int> counter = ref.watch(autoCounterProvider(initValue));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto Counter'),
      ),
      body: Center(
        child: Text(
          counter
              .when(
                  data: (int value) => value,
                  error: (Object e, _) => e,
                  loading: () => initValue)
              .toString(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}