// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_form_provider.dart';

// **************************************************************************
// FormProviderGenerator
// **************************************************************************

class HoustonProfileFormProvider extends StateNotifier<Profile> {
  final Ref ref;
  final String uuid;
  final GlobalKey<FormState> formKey = GlobalKey();
  bool changesMade = false;

  HoustonProfileFormProvider(this.ref, this.uuid, Profile initialState)
      : super(initialState) {
    load(uuid);
    fieldListeners();
  }

  void load(String uuid) async {
    if (uuid.isNotEmpty && uuid != "new") {
      final profile = await ProfileDbService().retrieve(uuid: uuid);
      if (profile != null) {
        state = profile;
      } else {
        handleEmpty();
      }
    } else {
      handleEmpty();
    }

    setFields();
    changesMade = false;
  }

  void handleEmpty() {
    state = Profile.empty();
  }

  Future<bool> discard() async {
    if (changesMade) {
      final confirmed = await ConfirmDialog.show(
          title: "Are you sure you want to discard all unsaved changes?");

      if (confirmed != true) {
        return false;
      }
    }
    clear();
    return true;
  }

  void clear() {
    handleEmpty();
    clearFields();
  }

  Future<bool?> delete() async {
    final confirmed = await ConfirmDialog.show(
      title: 'Are you sure you want to delete this Profile?',
      destructive: true,
    );

    if (confirmed == true) {
      ref.read(globalLoadingProvider.notifier).start();
      final success = await ProfileDbService().delete(state);
      ref.read(globalLoadingProvider.notifier).complete();

      if (success) {
        ref.read(profileListProvider.notifier).refresh();
        Toast.message("Profile deleted.");
        return true;
      } else {
        Toast.error();
        return false;
      }
    }
    return null;
  }

  bool additionalValidation() {
    return true;
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    if (!additionalValidation()) {
      return null;
    }

    ref.read(globalLoadingProvider.notifier).start();
    final profile = await ProfileDbService().save(state);

    if (profile != null) {
      state = profile;
      ref.read(profileListProvider.notifier).refresh();
      ref.invalidate(profileDetailProvider(profile.uuid));
      ref.read(globalLoadingProvider.notifier).complete();
      return true;
    }

    ref.read(globalLoadingProvider.notifier).complete();
    return false;
  }

  void fieldListeners() {}
  void setFields() {}
  void clearFields() {}
}
