import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FormImagePicker extends StatefulWidget {
  const FormImagePicker({super.key, this.labelText, this.errorText, this.onChanged, this.value});

  final String? labelText;
  final String? errorText;
  final ValueChanged<String?>? onChanged;
  final String? value;

  @override
  State<FormImagePicker> createState() => _FormImagePickerState();
}

class _FormImagePickerState extends State<FormImagePicker> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      widget.onChanged?.call(pickedFile.path);
    }
  }

  void _showPickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Chọn từ thư viện'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Chụp ảnh'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
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
        if (widget.labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              widget.labelText!,
              style: const TextStyle(),
            ),
          ),
        GestureDetector(
          onTap: () => _showPickerOptions(context),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffD0D5DD)),
              borderRadius: BorderRadius.circular(8.0),
              color: const Color(0xffD0D5DD),
            ),
            child: _imageFile != null || widget.value != null
                ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                _imageFile ?? File(widget.value!),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            )
                : Center(
              child: Text(
                widget.errorText ?? 'Nhấn để chọn ảnh',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
