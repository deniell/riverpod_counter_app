import 'package:flutter/material.dart';
import 'package:riverpod_counter_app/models/person.dart';

class UpdatePerson extends StatefulWidget {
  final Person? existingPerson;

  const UpdatePerson({
    this.existingPerson,
    Key? key,
  }) : super(key: key);

  @override
  State<UpdatePerson> createState() => _UpdatePersonState();
}

class _UpdatePersonState extends State<UpdatePerson> {
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
        )

      ],
    );
  }
}
