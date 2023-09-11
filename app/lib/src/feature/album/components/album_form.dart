import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/image_uploader.dart';

import '../../../core/components/base_component.dart';
import '../providers/album_form_provider.dart';
import '../models/album.dart';

part 'album_form.g.dart';

@houstonForm
class AlbumForm extends HoustonAlbumForm {
  const AlbumForm({super.key, required super.uuid});

  @override
  List<Widget> fields(BuildContext context, WidgetRef ref,
      AlbumFormProvider provider, Album model) {
    return [
      TextFormField(
        controller: provider.titleController,
        validator: provider.titleValidator,
        decoration: const InputDecoration(label: Text("Title")),
      ),
      TextFormField(
        controller: provider.descriptionController,
        validator: provider.descriptionValidator,
        decoration: const InputDecoration(label: Text("Description")),
        minLines: 3,
        maxLines: 3,
      ),
      TextFormField(
        controller: provider.yearController,
        validator: provider.yearValidator,
        decoration: const InputDecoration(label: Text("Year")),
      ),
      ImageUploader(
        label: "Image",
        url: model.image,
        onChange: (url) {
          provider.setImage(url);
        },
      )
    ];
  }
}
