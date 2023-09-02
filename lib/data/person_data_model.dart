import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:riverpod_counter_app/models/person.dart';

class PersonDataModel extends ChangeNotifier {
  final List<Person> _people = [];

  int get count => _people.length;

  UnmodifiableListView<Person> get people => UnmodifiableListView(_people);

  void add(Person person) {
    _people.add(person);
    notifyListeners();
  }

  void remove(Person person) {
    _people.remove(person);
    notifyListeners();
  }

  void update(Person updatePerson) {
    final index = _people.indexOf(updatePerson);
    final oldPerson = _people[index];
    if (oldPerson.name != updatePerson.name ||
        oldPerson.age != updatePerson.age) {
      _people[index] = oldPerson.updated(
        updatePerson.name,
        updatePerson.age,
      );
      notifyListeners();
    }
  }
}