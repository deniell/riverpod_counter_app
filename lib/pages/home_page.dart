import 'package:flutter/material.dart';
import 'package:riverpod_counter_app/pages/auto_counter_page.dart';
import 'package:riverpod_counter_app/pages/clock_page.dart';
import 'package:riverpod_counter_app/pages/counter_page.dart';
import 'package:riverpod_counter_app/pages/date_time_page.dart';
import 'package:riverpod_counter_app/pages/names_page.dart';
import 'package:riverpod_counter_app/pages/state_notifier_counter_page.dart';
import 'package:riverpod_counter_app/pages/weather_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Go to Counter Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const CounterPage()),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Go to Auto Counter Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const AutoCounterPage()),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Go to State Notifier Counter Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const StateNotifierCounterPage()),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Go to Date Time Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const DateTimePage()),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Go to Clock Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const ClockPage()),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Go Weather Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const WeatherPage()),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Go Names Pag'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const NamesPage()),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
