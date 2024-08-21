import 'package:basic/import.dart';

class FormSelect extends StatefulWidget {
  const FormSelect({
    super.key,
    required this.items,
    this.hint,
    this.labelText,
    this.value,
    this.onChanged,
    this.errorText,
  });

  final dynamic items;
  final String? hint;
  final String? value;
  final ValueChanged? onChanged;
  final String? errorText;
  final String? labelText;

  @override
  State<FormSelect> createState() => _FormSelectState();
}

class _FormSelectState extends State<FormSelect> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = !empty(widget.value) ? widget.value! : '-- Chọn --';
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
          child: ListView.builder(
            itemCount: widget.items.length,
            itemBuilder: (BuildContext context, int index) {
              if (widget.items is List) {
                return ListTile(
                  title: Text(widget.items[index].toString()),
                  onTap: () {
                    setState(() {
                      selectedValue = widget.items[index];
                      widget.onChanged?.call(selectedValue);
                    });
                    Navigator.pop(context);
                  },
                );
              } else if (widget.items is Map) {
                final key = widget.items.keys.toList()[index];
                final item = widget.items[key];

                final value = item is Map ? item.values.first : item;

                return ListTile(
                  title: Text(value.toString()),
                  onTap: () {
                    setState(() {
                      selectedValue = value.toString();
                      widget.onChanged?.call(selectedValue);
                    });
                    Navigator.pop(context);
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
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
            child: Text(
              selectedValue,
              style: TextStyle(
                color: selectedValue.isEmpty ? AppColors.grey90 : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
