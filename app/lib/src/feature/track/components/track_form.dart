import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/buttons.dart';
import '../../album/models/album.dart';
import '../../album/components/album_list.dart';

import '../../../core/components/base_component.dart';
import '../providers/track_form_provider.dart';
import '../models/track.dart';

part 'track_form.g.dart';

@houstonForm
class TrackForm extends HoustonTrackForm {
  const TrackForm({super.key, required super.uuid});

  @override
  List<Widget> fields(BuildContext context, WidgetRef ref,
      TrackFormProvider provider, Track model) {
    return [
      TextFormField(
        controller: provider.titleController,
        validator: provider.titleValidator,
        decoration: const InputDecoration(label: Text("Title")),
      ),
      TextFormField(
        controller: provider.artistController,
        validator: provider.artistValidator,
        decoration: const InputDecoration(label: Text("Artist")),
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: const Text("Album"),
        subtitle:
            model.album.exists ? Text(model.album.title) : const Text("-"),
        trailing: AppButton(
          label: "Choose",
          onPressed: () async {
            final Album? album = await showModalBottomSheet(
              context: context,
              builder: (context) {
                return AlbumList(
                  onPressed: (album) => Navigator.of(context).pop(album),
                );
              },
            );
            if (album != null) {
              provider.setAlbum(album);
            }
          },
        ),
      ),
    ];
  }
}
