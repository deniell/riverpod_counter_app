import 'package:hooks_riverpod/hooks_riverpod.dart';

enum City {Stockholm, Paris, Tokyo,}

typedef WeatherEmoji = String;

Future<WeatherEmoji> getWeather(City city) {
  return Future.delayed(
    const Duration(seconds: 1),
    () => {
      City.Stockholm: 'snow',
      City.Paris: 'rain',
      City.Tokyo: 'cloudy'
    }[city] ?? 'sun'
  );
}

// UI writes to and reads from this
final currentCityProvider = StateProvider<City?>((ref) => null);

const unknownWeatherEmoji = 'unknown';

// UI reads this
final weatherProvider = FutureProvider<WeatherEmoji>(
  (ref) {
    final city = ref.watch(currentCityProvider);
    if (city != null) {
      return getWeather(city);
    } else {
      return unknownWeatherEmoji;
    }
  },
);