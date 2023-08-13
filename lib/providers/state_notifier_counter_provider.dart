import 'package:flutter_riverpod/flutter_riverpod.dart';

final stateNotifierCounterProvider = StateNotifierProvider<Counter, int?>(
        (ref) => Counter(),
);