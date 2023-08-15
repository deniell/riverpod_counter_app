import 'package:hooks_riverpod/hooks_riverpod.dart';

extension OptionalInfixAdition<T extends num> on T? {
  T? operator + (T? other) {
    final shadow = this;
    if (shadow != null) {
      return shadow + (other ?? 0) as T;
    } else {
      return null;
    }
  }
}

class Counter extends StateNotifier<int?> {
  Counter() : super(null);
  void increment() => state = state == null ? 1 : state + 1;
  void refresh() => state = null;
}

final stateNotifierCounterProvider = StateNotifierProvider<Counter, int?>(
  (ref) => Counter(),
);