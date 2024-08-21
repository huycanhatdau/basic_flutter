import 'package:basic/import.dart';

class FormTextField extends StatefulWidget {
  const FormTextField({
    super.key,
    required this.value,
    this.hintText,
    this.errorText,
    this.isEmail = false,
    this.labelText,
    this.onChanged,
    this.keyInput,
    this.obscureText = false,
    this.suffix,
  });

  final TextEditingController value;
  final String? hintText;
  final String? errorText;
  final bool isEmail;
  final String? labelText;
  final Function(String)? onChanged;
  final Key? keyInput;
  final bool obscureText;
  final Widget? suffix;

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            obscureText: widget.obscureText,
            controller: widget.value,
            key: widget.keyInput,
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: const TextStyle(
                color: AppColors.primaryColor,
              ),
              fillColor: Colors.white54,
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              focusColor: Colors.white60,
              suffixIcon: widget.suffix,
              errorText: !empty(widget.errorText) ? widget.errorText : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: AppColors.grey50),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: AppColors.grey50),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: AppColors.error, width: 1.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: AppColors.error, width: 1.5),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}
