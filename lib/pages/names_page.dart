import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_counter_app/providers/names_provider.dart';

class NamesPage extends ConsumerWidget {
  const NamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final names = ref.watch(namesProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Names'),
      ),
      body: names.when(
        data: (names) {
          return ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(names.elementAt(index)),
              );
            }
          );
        },
        error: (error, stackTrace) => const Text('Reached the end of the list!'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

