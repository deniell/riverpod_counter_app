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

final currentCityProvider = StateProvider<City?>((ref) => null);

const unknownWeatherEmoji = '';

final weatherProvider = FutureProvider<WeatherEmoji>((ref) {
  final city = ref.watch(currentCityProvider);
  if (city != null) {
    return getWeather(city);
  } else {
    return unknownWeatherEmoji;
  }
});