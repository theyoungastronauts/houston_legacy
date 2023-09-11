// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_list_provider.dart';

// **************************************************************************
// ListProviderGenerator
// **************************************************************************

class HoustonTrackListProvider extends StateNotifier<List<Track>> {
  final PagingController<int, Track> pagingController =
      PagingController(firstPageKey: 1);

  HoustonTrackListProvider([List<Track> initialItems = const []])
      : super(initialItems) {
    pagingController.addPageRequestListener((page) {
      fetchPage(page);
    });
  }

  Future<void> fetchPage(int page) async {
    try {
      final response = await TrackDbService().list(page);

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
