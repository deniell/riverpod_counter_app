import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_counter_app/data/person_data_model.dart';

final peopleProvider = ChangeNotifierProvider(
  (_) => PersonDataModel(),
);