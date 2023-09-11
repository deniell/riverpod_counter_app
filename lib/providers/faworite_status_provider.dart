import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoriteStatusProvider = StateProvider(
  (_) => FavoriteStatus.all,
);

enum FavoriteStatus {
  all,
  favorite,
  notFavorite,
}