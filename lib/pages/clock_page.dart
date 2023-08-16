import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_counter_app/providers/clock_provider.dart';

class ClockPage extends ConsumerWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTime = ref.watch(clockProvider.notifier);
    final timeFormated = DateFormat.Hms().format(currentTime);
    return Scaffold(
      body: Center(
        child: Text(
          timeFormated,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
