import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/dialogs.dart';
import '../../../core/utils/toast.dart';
import '../../../core/utils/validation.dart';

import '../../../core/providers/global_loading_provider.dart';
import '../models/track.dart';
import '../services/track_db_service.dart';
import 'track_detail_provider.dart';
import 'track_list_provider.dart';

import '../../album/models/album.dart';
part 'track_form_provider.g.dart';

@houstonFormProvider
class TrackFormProvider extends HoustonTrackFormProvider {
  TrackFormProvider(ref, uuid, initialState) : super(ref, uuid, initialState);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController artistController = TextEditingController();

  String? titleValidator(String? value) =>
      formValidatorNotEmpty(value, "Title");
  String? artistValidator(String? value) =>
      formValidatorNotEmpty(value, "Artist");

  @override
  void fieldListeners() {
    titleController.addListener(() {
      changesMade = true;
      state = state.copyWith(title: titleController.text);
    });

    artistController.addListener(() {
      changesMade = true;
      state = state.copyWith(artist: artistController.text);
    });
  }

  @override
  void setFields() {
    titleController.text = state.title;
    artistController.text = state.artist;
  }

  @override
  void clearFields() {
    titleController.text = '';
    artistController.text = '';
  }

  void setAlbum(Album album) {
    state = state.copyWith(album: album);
  }

  @override
  bool additionalValidation() {
    if (!state.album.exists) {
      Toast.error("Album Required!");
      return false;
    }
    return true;
  }
}

final trackFormProvider =
    StateNotifierProvider.family<TrackFormProvider, Track, String>((ref, uuid) {
  return TrackFormProvider(ref, uuid, Track.empty());
});
