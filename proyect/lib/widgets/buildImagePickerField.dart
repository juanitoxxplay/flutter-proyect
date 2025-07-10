import 'dart:io';
import 'package:flutter/material.dart';
import '../theme/theme.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerField extends StatefulWidget {
  final void Function(File?) onImageSelected;

  const ImagePickerField({super.key, required this.onImageSelected});

  @override
  State<ImagePickerField> createState() => _ImagePickerFieldState();
}

class _ImagePickerFieldState extends State<ImagePickerField> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: source);

    if (picked != null) {
      final image = File(picked.path);
      setState(() => _imageFile = image);
      widget.onImageSelected(image);
    }
  }

  void _showPickOptionsDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library, color: FordTheme.fordBlue),
              title: const Text('Seleccionar desde galería'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: FordTheme.fordBlue),
              title: const Text('Tomar foto con cámara'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Foto del Auto',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: FordTheme.silver,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _showPickOptionsDialog,
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: FordTheme.white,
              border: Border.all(color: FordTheme.silver),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1F000000),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: _imageFile == null
                ? const Center(
              child: Icon(Icons.add_a_photo,
                  size: 40, color: FordTheme.silver),
            )
                : ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.file(
                _imageFile!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
