import 'package:flutter/material.dart';

class FormSelectMultiple extends StatefulWidget {
  const FormSelectMultiple({
    super.key,
    required this.items,
    this.hint,
    this.labelText,
    this.value,
    this.onChanged,
    this.errorText,
  });

  final Map<String, dynamic> items;
  final String? hint;
  final List<dynamic>? value;
  final ValueChanged<dynamic>? onChanged;
  final String? errorText;
  final String? labelText;

  @override
  State<FormSelectMultiple> createState() => _FormSelectMultipleState();
}

class _FormSelectMultipleState extends State<FormSelectMultiple> {
  late ValueNotifier<List<dynamic>> _selectedValuesNotifier;

  @override
  void initState() {
    super.initState();
    _selectedValuesNotifier = ValueNotifier(widget.value ?? []);
  }

  @override
  void dispose() {
    _selectedValuesNotifier.dispose();
    super.dispose();
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          height: 250,
          child: ValueListenableBuilder(
            valueListenable: _selectedValuesNotifier,
            builder: (context, selectedValues, child) {
              return ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (BuildContext context, int index) {
                  final key = widget.items.keys.elementAt(index);
                  final value = widget.items[key].values.first.toString();
                  final isSelected = selectedValues.contains(key);

                  return ListTile(
                    title: Text(value),
                    trailing: isSelected
                        ? const Icon(Icons.check_box)
                        : const Icon(Icons.check_box_outline_blank),
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedValues.remove(key);
                        } else {
                          selectedValues.add(key);
                        }
                        _selectedValuesNotifier.value = List.from(selectedValues); // Notify listeners
                        widget.onChanged?.call(_selectedValuesNotifier.value);
                      });
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: _showBottomSheet,
          child: InputDecorator(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              labelText: widget.labelText,
              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              hintText: widget.hint,
              errorText: widget.errorText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: ValueListenableBuilder(
              valueListenable: _selectedValuesNotifier,
              builder: (context, selectedValues, child) {
                return Text(
                  selectedValues.isEmpty
                      ? '-- Chọn -- '
                      : selectedValues.map((key) => widget.items[key].values.first.toString()).join(', '),
                  style: TextStyle(
                    color: selectedValues.isEmpty ? Colors.grey : Colors.black,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
