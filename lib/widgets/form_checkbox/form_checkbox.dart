import 'package:flutter/material.dart';

class FormCheckbox extends StatefulWidget {
  const FormCheckbox({
    super.key,
    this.error = false,
    this.value = false,
    this.onChanged,
    required this.labelText,
  });

  final bool error;
  final bool value;
  final String labelText;
  final void Function(bool?)? onChanged;

  @override
  State<FormCheckbox> createState() => _FormCheckboxState();
}

class _FormCheckboxState extends State<FormCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Transform.translate(
          offset: const Offset(-14, 0),
          child: Checkbox(
            isError: widget.error,
            value: widget.value,
            onChanged: widget.onChanged,
            activeColor: widget.error ? Colors.red : null
          ),
        ),
        Transform.translate(
          offset: const Offset(-20, 0),
          child: Text(widget.labelText),
        )
      ],
    );
  }
}
