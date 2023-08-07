import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter_app/main.dart';

// ConsumerWidget is like a StatelessWidget
// but with a WidgetRef parameter added in the build method.
class AutoCounterPage extends ConsumerWidget {
  const AutoCounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Using the WidgetRef to get the counter int from the counterProvider.
    // The watch method makes the widget rebuild whenever the int changes value.
    //   - something like setState() but automatic
    final AsyncValue<int> counter = ref.watch(autoCounterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}