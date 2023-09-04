// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_list_provider.dart';

// **************************************************************************
// ListProviderGenerator
// **************************************************************************

class HoustonAlbumListProvider extends StateNotifier<List<Album>> {
  final PagingController<int, Album> pagingController =
      PagingController(firstPageKey: 1);

  HoustonAlbumListProvider([List<Album> initialItems = const []])
      : super(initialItems) {
    pagingController.addPageRequestListener((page) {
      fetchPage(page);
    });
  }

  Future<void> fetchPage(int page) async {
    try {
      final response = await AlbumDbService().list(page);

      if (response.canLoadMore) {
        pagingController.appendPage(response.results, page + 1);
      } else {
        pagingController.appendLastPage(response.results);
      }

      state = [...state, ...response.results];
    } catch (error) {
      pagingController.error = error;
    }
  }

  void refresh() {
    state = [];
    pagingController.refresh();
  }
}
