import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter_app/pages/home_page.dart';

abstract class WebsocketClient {
  Stream<int> getCounterStream();
}

class FakeWebsocketClient extends WebsocketClient {
  @override
  Stream<int> getCounterStream() async* {
    int i = 0;
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      yield i++;
    }
  }
}

final websocketClientProvider = Provider<WebsocketClient>(
    (ref) {
      return FakeWebsocketClient();
    }
);

final autoCounterProvider = StateProvider((ref) {
  final wsClient = ref.watch(websocketClientProvider);
  wsClient.getCounterStream();
});

final counterProvider = StateProvider((ref) => 0);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
