import 'package:flutter/material.dart';
import 'package:riverpod_counter_app/models/person.dart';
import 'package:riverpod_counter_app/shared/components/update_person.dart';

Future<Person?> unfollowDialog({
  required BuildContext context,
}) async
{
  return showDialog<Person?>(
    context: context,
    builder: (BuildContext context)
    {
      return AlertDialog(
        title: const Text('Create a person'),
        content: const UpdatePerson(),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {},
          ),
          TextButton(
            child: const Text('Create'),
            onPressed: () {},
          ),
        ],
      );
    },
  );
}