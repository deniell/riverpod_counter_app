import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_counter_app/models/film.dart';
import 'package:riverpod_counter_app/providers/films_provider.dart';

class FilmsList extends ConsumerWidget {
  final AlwaysAliveProviderBase<Iterable<Film>> provider;
  const FilmsList({
    required this.provider,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final films = ref.watch(provider);
    return Expanded(
        child: ListView.builder(
          itemCount: films.length,
            itemBuilder: (context, index) {
              final film = films.elementAt(index);
              final favoriteIcon = film.isFavorite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border);
              return ListTile(
                title: Text(film.title),
                subtitle: Text(film.description),
                trailing: IconButton(
                  icon: favoriteIcon,
                  onPressed: () {
                    final isFavorite = !film.isFavorite;
                    ref.read(allFilmsProvider.notifier).update(film, isFavorite);
                  },
                ),
              );
            },
        ),
    );
  }
}
