import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/dialogs.dart';
import '../../../core/utils/toast.dart';
import '../../../core/utils/validation.dart';

import '../../../core/providers/global_loading_provider.dart';
import '../models/profile.dart';
import '../services/profile_db_service.dart';
import 'profile_detail_provider.dart';
import 'profile_list_provider.dart';

part 'profile_form_provider.g.dart';

@houstonFormProvider
class ProfileFormProvider extends HoustonProfileFormProvider {
  ProfileFormProvider(ref, uuid, initialState) : super(ref, uuid, initialState);

  final TextEditingController avatarController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  String? avatarValidator(String? value) =>
      formValidatorNotEmpty(value, "Avatar");
  String? bioValidator(String? value) => formValidatorNotEmpty(value, "Bio");

  @override
  void fieldListeners() {
    avatarController.addListener(() {
      changesMade = true;
      state = state.copyWith(avatar: avatarController.text);
    });

    bioController.addListener(() {
      changesMade = true;
      state = state.copyWith(bio: bioController.text);
    });
  }

  @override
  void setFields() {
    avatarController.text = state.avatar;
    bioController.text = state.bio;
  }

  @override
  void clearFields() {
    avatarController.text = '';
    bioController.text = '';
  }
}

final profileFormProvider =
    StateNotifierProvider.family<ProfileFormProvider, Profile, String>(
        (ref, uuid) {
  return ProfileFormProvider(ref, uuid, Profile.empty());
});
