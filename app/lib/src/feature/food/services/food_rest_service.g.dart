// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_rest_service.dart';

// **************************************************************************
// RestServiceGenerator
// **************************************************************************

class HoustonFoodRestService extends RestService {
  String get basePath => "/food";

  Future<Food> retrieve(String uuid) async {
    try {
      final response = await getHttp('$basePath/$uuid');
      return Food.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<PaginatedResponse<Food>> list({
    int page = 1,
    int limit = 10,
    String? path,
    Map<String, dynamic> params = const {},
  }) async {
    try {
      path ??= basePath;
      final builtParams = {
        ...buildPage(page),
        ...buildLimit(limit),
        ...params,
      };

      final response = await getHttp(path, params: builtParams);

      List<Food> results =
          response['results'].map<Food>((item) => Food.fromJson(item)).toList();

      return PaginatedResponse(
        count: response['count'],
        page: response['page'],
        num_pages: response['num_pages'],
        results: results,
      );
    } catch (e, stackTrace) {
      Debugger.error("Problem fetching $path", e, stackTrace);
      return PaginatedResponse.empty();
    }
  }

  Future<Food?> save(Food food) async {
    return food.id != 0 ? _update(food) : _create(food);
  }

  Future<Food?> _create(Food food) async {
    final p = await postHttp(basePath, params: food.toJson());
    return Food.fromJson(p);
  }

  Future<Food?> _update(Food food) async {
    final p = await patchHttp("$basePath/$food.uuid}", params: food.toJson());
    return Food.fromJson(p);
  }

  Future<bool> delete(Food food) async {
    try {
      await deleteHttp("$basePath/$food.uuid}");
      return true;
    } catch (e) {
      return false;
    }
  }
}
