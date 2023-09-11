import 'dart:io';

import 'package:app/src/core/components/base_component.dart';
import 'package:app/src/core/components/buttons.dart';
import 'package:app/src/core/services/upload_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploader extends BaseComponent {
  final String label;
  final String url;
  final Function(String) onChange;
  const ImageUploader({
    super.key,
    required this.label,
    required this.url,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(label),
      leading: SizedBox(
        width: 40,
        height: 40,
        child: Builder(
          builder: (context) {
            if (url.isNotEmpty) {
              return Image.network(
                url,
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              );
            }
            return const Placeholder();
          },
        ),
      ),
      trailing: AppButton(
        label: url.isEmpty ? "Upload" : "Replace",
        onPressed: () async {
          final file = await ImagePicker().pickImage(source: ImageSource.gallery);
          if (file != null) {
            final url = await UploadService().uploadFile(File(file.path));
            onChange(url);
          }
        },
      ),
    );
  }
}
