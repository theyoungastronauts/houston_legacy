// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_form_provider.dart';

// **************************************************************************
// FormProviderGenerator
// **************************************************************************

class HoustonAlbumFormProvider extends StateNotifier<Album> {
  final Ref ref;
  final String uuid;
  final GlobalKey<FormState> formKey = GlobalKey();
  bool changesMade = false;

  HoustonAlbumFormProvider(this.ref, this.uuid, Album initialState)
      : super(initialState) {
    load(uuid);
    fieldListeners();
  }

  void load(String uuid) async {
    Album? album;
    if (uuid.isNotEmpty) {
      album = await AlbumDbService().retrieve(uuid: uuid);
    }
    state = album ?? Album.empty();
    setFields();
    changesMade = false;
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
    state = Album.empty();
    clearFields();
  }

  Future<bool?> delete() async {
    final confirmed = await ConfirmDialog.show(
      title: 'Are you sure you want to delete this Album?',
      destructive: true,
    );

    if (confirmed == true) {
      ref.read(globalLoadingProvider.notifier).start();
      final success = await AlbumDbService().delete(state);
      ref.read(globalLoadingProvider.notifier).complete();

      if (success) {
        ref.read(albumListProvider.notifier).refresh();
        Toast.message("Album deleted.");
        return true;
      } else {
        Toast.error();
        return false;
      }
    }
    return null;
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    ref.read(globalLoadingProvider.notifier).start();
    final album = await AlbumDbService().save(state);

    if (album != null) {
      state = album;
      ref.read(albumListProvider.notifier).refresh();
      ref.invalidate(albumDetailProvider(album.uuid));
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
