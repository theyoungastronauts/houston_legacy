// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_list_provider.dart';

// **************************************************************************
// ListProviderGenerator
// **************************************************************************

class HoustonFoodListProvider extends StateNotifier<List<Food>> {
  final PagingController<int, Food> pagingController =
      PagingController(firstPageKey: 1);

  HoustonFoodListProvider([List<Food> initialItems = const []])
      : super(initialItems) {
    pagingController.addPageRequestListener((page) {
      fetchPage(page);
    });
  }

  Future<void> fetchPage(int page) async {
    try {
      final response = await FoodDbService().list(page);

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
