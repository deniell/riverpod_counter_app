import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_counter_app/models/film.dart';
import 'package:riverpod_counter_app/pages/films_page/components/films_notifier.dart';

final allFilmsProvider = StateNotifierProvider<FilmsNotifier, List<Film>>(
    (_) => FilmsNotifier(),
);

final favoriteFilmsProvider = Provider<Iterable<Film>>(
    (ref) => ref.watch(allFilmsProvider).where((film) => film.isFavorite),
);

final notFavoriteFilmsProvider = Provider<Iterable<Film>>(
      (ref) => ref.watch(allFilmsProvider).where((film) => !film.isFavorite),
);