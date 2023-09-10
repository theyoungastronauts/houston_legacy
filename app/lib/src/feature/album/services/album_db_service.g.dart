// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_db_service.dart';

// **************************************************************************
// DbServiceGenerator
// **************************************************************************

class HoustonAlbumDbService extends DbService {
  @override
  String get table => "album";

  Future<DbListResponse<Album>> list(int page,
      {int limit = 10, String? select}) async {
    final response = await listData(page, limit: limit, select: select);

    return DbListResponse<Album>(
      results:
          response.data.map<Album>((item) => Album.fromJson(item)).toList() ??
              [],
      status: response.status,
      count: response.count ?? 0,
      page: page,
      limit: limit,
    );
  }

  Future<Album?> retrieve({int? id, String? uuid, String? select}) async {
    final response =
        await retrieveDataByIdentifier(id: id, uuid: uuid, select: select);
    return response != null ? Album.fromJson(response) : null;
  }

  Future<Album?> save(Album album) async {
    dynamic response;
    if (album.exists) {
      response = await updateData(album.id, album.toJson());
    } else {
      response = await insertData(album.toJson());
    }
    return response != null ? Album.fromJson(response) : null;
  }

  Future<bool> delete(Album album) async {
    return await deleteData(album.id);
  }
}
