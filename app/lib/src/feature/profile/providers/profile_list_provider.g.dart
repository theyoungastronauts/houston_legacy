// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_list_provider.dart';

// **************************************************************************
// ListProviderGenerator
// **************************************************************************

class HoustonProfileListProvider extends StateNotifier<List<Profile>> {
  final PagingController<int, Profile> pagingController =
      PagingController(firstPageKey: 1);

  HoustonProfileListProvider([List<Profile> initialItems = const []])
      : super(initialItems) {
    pagingController.addPageRequestListener((page) {
      fetchPage(page);
    });
  }

  Future<void> fetchPage(int page) async {
    try {
      final response = await ProfileDbService().list(page);

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
