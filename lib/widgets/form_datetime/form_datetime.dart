import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class FormDateTimePicker extends StatefulWidget {
  const FormDateTimePicker({
    super.key,
    this.labelText,
    this.hintText,
    this.errorText,
    this.initialDate,
    this.initialTime,
    this.onChanged,
    this.value,
  });

  final String? labelText;
  final String? hintText;
  final String? errorText;
  final DateTime? initialDate;
  final TimeOfDay? initialTime;
  final ValueChanged<dynamic>? onChanged;
  final dynamic value;

  @override
  State<FormDateTimePicker> createState() => _FormDateTimePickerState();
}

class _FormDateTimePickerState extends State<FormDateTimePicker> {
  DateTime? selectedDateTime;

  @override
  void initState() {
    super.initState();

    if (widget.value != null && widget.value!.isNotEmpty) {
      int timestamp = int.parse(widget.value!);
      selectedDateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    } else {
      selectedDateTime = widget.initialDate ?? DateTime.now();
    }
  }

  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
        );
        widget.onChanged?.call(selectedDateTime!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => _selectDateTime(context),
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: widget.labelText,
              hintText: widget.hintText,
              errorText: widget.errorText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
            child: Text(
              selectedDateTime != null
                  ? DateFormat('dd/MM/yyyy').format(selectedDateTime!)
                  : '-- Chọn --',
              style: TextStyle(
                color: selectedDateTime == null ? Colors.grey : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
