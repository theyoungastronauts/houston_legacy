// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_db_service.dart';

// **************************************************************************
// DbServiceGenerator
// **************************************************************************

class HoustonProfileDbService extends DbService {
  @override
  String get table => "profile";

  Future<DbListResponse<Profile>> list(int page,
      {int limit = 10, String? select}) async {
    final response = await listData(page, limit: limit, select: select);

    return DbListResponse<Profile>(
      results: response.data
              .map<Profile>((item) => Profile.fromJson(item))
              .toList() ??
          [],
      status: response.status,
      count: response.count ?? 0,
      page: page,
      limit: limit,
    );
  }

  Future<Profile?> retrieve({int? id, String? uuid, String? select}) async {
    final response =
        await retrieveDataByIdentifier(id: id, uuid: uuid, select: select);
    return response != null ? Profile.fromJson(response) : null;
  }

  Future<Profile?> save(Profile profile) async {
    dynamic response;
    if (profile.exists) {
      response = await updateData(profile.id, profile.toJson());
    } else {
      response = await insertData(profile.toJson());
    }
    return response != null ? Profile.fromJson(response) : null;
  }

  Future<bool> delete(Profile profile) async {
    return await deleteData(profile.id);
  }
}
