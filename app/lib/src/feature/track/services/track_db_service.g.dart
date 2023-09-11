// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_db_service.dart';

// **************************************************************************
// DbServiceGenerator
// **************************************************************************

class HoustonTrackDbService extends DbService {
  @override
  String get table => "track";

  Future<DbListResponse<Track>> list(int page,
      {int limit = 10, String? select}) async {
    final response = await listData(page, limit: limit, select: select);

    return DbListResponse<Track>(
      results:
          response.data.map<Track>((item) => Track.fromJson(item)).toList() ??
              [],
      status: response.status,
      count: response.count ?? 0,
      page: page,
      limit: limit,
    );
  }

  Future<Track?> retrieve({int? id, String? uuid, String? select}) async {
    final response =
        await retrieveDataByIdentifier(id: id, uuid: uuid, select: select);
    return response != null ? Track.fromJson(response) : null;
  }

  Future<Track?> save(Track track) async {
    dynamic response;
    if (track.exists) {
      response = await updateData(track.id, track.toJson());
    } else {
      response = await insertData(track.toJson());
    }
    return response != null ? Track.fromJson(response) : null;
  }

  Future<bool> delete(Track track) async {
    return await deleteData(track.id);
  }
}
