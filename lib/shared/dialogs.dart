import 'package:flutter/material.dart';
import 'package:riverpod_counter_app/models/person.dart';
import 'package:riverpod_counter_app/shared/components/update_person.dart';

Future<Person?> unfollowDialog({
  required BuildContext context,
}) async
{
  final GlobalKey<UpdatePersonState> updatePersonKey =
      GlobalKey<UpdatePersonState>();
  final UpdatePerson updatePerson = UpdatePerson(key: updatePersonKey);

  return showDialog<Person?>(
    context: context,
    builder: (BuildContext context)
    {
      return AlertDialog(
        title: const Text('Create a person'),
        content: updatePerson,
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Save'),
            onPressed: () {
              final Person? person = updatePerson.createState.updateUser();
              Navigator.of(context).pop(person);
            },
          ),
        ],
      );
    },
  );
}