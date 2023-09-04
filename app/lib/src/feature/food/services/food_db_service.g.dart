// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_db_service.dart';

// **************************************************************************
// DbServiceGenerator
// **************************************************************************

class HoustonFoodDbService extends DbService {
  @override
  String get table => "food";

  Future<DbListResponse<Food>> list(int page,
      {int limit = 10, String? select}) async {
    final response = await listData(page, limit: limit, select: select);

    return DbListResponse<Food>(
      results:
          response.data.map<Food>((item) => Food.fromJson(item)).toList() ?? [],
      status: response.status,
      count: response.count ?? 0,
      page: page,
      limit: limit,
    );
  }

  Future<Food?> retrieve({int? id, String? uuid, String? select}) async {
    final response =
        await retrieveDataByIdentifier(id: id, uuid: uuid, select: select);
    return response != null ? Food.fromJson(response) : null;
  }

  Future<Food?> save(Food food) async {
    dynamic response;
    if (food.exists) {
      response = await updateData(food.id, food.toJson());
    } else {
      response = insertData(food.toJson());
    }
    return response != null ? Food.fromJson(response) : null;
  }

  Future<bool> delete(Food food) async {
    return await deleteData(food.id);
  }
}
