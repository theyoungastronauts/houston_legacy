import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/dialogs.dart';
import '../../../core/utils/toast.dart';
import '../../../core/utils/validation.dart';

import '../../../core/providers/global_loading_provider.dart';
import '../models/album.dart';
import '../services/album_db_service.dart';
import 'album_detail_provider.dart';
import 'album_list_provider.dart';

part 'album_form_provider.g.dart';

@houstonFormProvider
class AlbumFormProvider extends HoustonAlbumFormProvider {
  AlbumFormProvider(ref, uuid, initialState) : super(ref, uuid, initialState);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  String? titleValidator(String? value) =>
      formValidatorNotEmpty(value, "Title");
  String? descriptionValidator(String? value) =>
      formValidatorNotEmpty(value, "Description");
  String? yearValidator(String? value) => formValidatorNotEmpty(value, "Year");

  @override
  void fieldListeners() {
    titleController.addListener(() {
      changesMade = true;
      state = state.copyWith(title: titleController.text);
    });

    descriptionController.addListener(() {
      changesMade = true;
      state = state.copyWith(description: descriptionController.text);
    });

    yearController.addListener(() {
      changesMade = true;
      state = state.copyWith(year: int.tryParse(yearController.text) ?? 0);
    });
  }

  @override
  void setFields() {
    titleController.text = state.title;
    descriptionController.text = state.description;
    yearController.text = state.year.toString();
  }

  @override
  void clearFields() {
    titleController.text = '';
    descriptionController.text = '';
    yearController.text = '';
  }
}

final albumFormProvider =
    StateNotifierProvider.family<AlbumFormProvider, Album, String>((ref, uuid) {
  return AlbumFormProvider(ref, uuid, Album.empty());
});
