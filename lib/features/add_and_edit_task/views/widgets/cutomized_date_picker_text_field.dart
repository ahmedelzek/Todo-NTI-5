import 'package:flutter/material.dart';

Future<void> selectDate({
  required BuildContext context,
  required TextEditingController dateController,
}) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null) {
    dateController.text =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
  }
}
