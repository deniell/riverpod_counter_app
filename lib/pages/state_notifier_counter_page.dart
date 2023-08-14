import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_counter_app/providers/state_notifier_counter_provider.dart';

class StateNotifierCounterPage extends ConsumerWidget {
  const StateNotifierCounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Counter'),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //     },
        //     icon: const Icon(Icons.refresh),
        //   )
        // ],
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final count = ref.watch(stateNotifierCounterProvider);
            final text = count == null ? "Press the button" : count;
            return Text(
              text.toString(),
              style: Theme.of(context).textTheme.displayMedium,
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(stateNotifierCounterProvider.notifier).increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
