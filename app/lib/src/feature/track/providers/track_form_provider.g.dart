// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_form_provider.dart';

// **************************************************************************
// FormProviderGenerator
// **************************************************************************

class HoustonTrackFormProvider extends StateNotifier<Track> {
  final Ref ref;
  final String uuid;
  final GlobalKey<FormState> formKey = GlobalKey();
  bool changesMade = false;

  HoustonTrackFormProvider(this.ref, this.uuid, Track initialState)
      : super(initialState) {
    load(uuid);
    fieldListeners();
  }

  void load(String uuid) async {
    if (uuid.isNotEmpty && uuid != "new") {
      final track = await TrackDbService().retrieve(uuid: uuid);
      if (track != null) {
        state = track;
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
    state = Track.empty();
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
      title: 'Are you sure you want to delete this Track?',
      destructive: true,
    );

    if (confirmed == true) {
      ref.read(globalLoadingProvider.notifier).start();
      final success = await TrackDbService().delete(state);
      ref.read(globalLoadingProvider.notifier).complete();

      if (success) {
        ref.read(trackListProvider.notifier).refresh();
        Toast.message("Track deleted.");
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
    final track = await TrackDbService().save(state);

    if (track != null) {
      state = track;
      ref.read(trackListProvider.notifier).refresh();
      ref.invalidate(trackDetailProvider(track.uuid));
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
