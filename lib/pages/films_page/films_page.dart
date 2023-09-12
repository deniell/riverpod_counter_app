import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_counter_app/pages/films_page/components/films_list.dart';
import 'package:riverpod_counter_app/pages/films_page/components/filter_widget.dart';
import 'package:riverpod_counter_app/providers/faworite_status_provider.dart';
import 'package:riverpod_counter_app/providers/films_provider.dart';

class FilmsPage extends ConsumerWidget {
  const FilmsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Films'),
      ),
      body: Column(
        children: [
          const FilterWidget(),
          Consumer(
            builder: (context, ref, child) {
              final filter = ref.watch(favoriteStatusProvider);
              switch (filter) {

                case FavoriteStatus.all:
                  return FilmsList(provider: allFilmsProvider);
                case FavoriteStatus.favorite:
                  return FilmsList(provider: favoriteFilmsProvider);
                case FavoriteStatus.notFavorite:
                  return FilmsList(provider: notFavoriteFilmsProvider);
              }
            }
          ),
        ],
      ),
    );
  }
}
