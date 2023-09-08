import 'package:flutter/material.dart';
import 'package:riverpod_counter_app/models/person.dart';

class UpdatePerson extends StatefulWidget {
  final Person? existingPerson;

  const UpdatePerson({
    this.existingPerson,
    Key? key,
  }) : super(key: key);

  @override
  State<UpdatePerson> createState() => UpdatePersonState();
}

class UpdatePersonState extends State<UpdatePerson> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  String? name;
  int? age;

  @override
  void initState() {
    name = widget.existingPerson?.name;
    age = widget.existingPerson?.age;

    nameController.text = name ?? '';
    ageController.text = age?.toString() ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Enter name heer...',
          ),
          onChanged: (value) => name = value,
        ),
        TextField(
          controller: ageController,
          decoration: const InputDecoration(
            labelText: 'Enter age heer...',
          ),
          onChanged: (value) => age = int.tryParse(value),
        ),
      ],
    );
  }

  Person? updateUser() {
    if (name != null && age != null) {
      if (widget.existingPerson != null) {
        // we have existing person, update it
        Person newPerson = widget.existingPerson!.updated(name, age);
        return newPerson;
      } else {
        // no existing person, create a new one
        final newPerson = Person(name: name!, age: age!);
        return newPerson;
      }
    } else {
      return null;
    }
  }
}
