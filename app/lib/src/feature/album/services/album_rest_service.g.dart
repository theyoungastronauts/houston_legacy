// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_rest_service.dart';

// **************************************************************************
// RestServiceGenerator
// **************************************************************************

class HoustonAlbumRestService extends RestService {
  String get basePath => "/album";

  Future<Album> retrieve(String uuid) async {
    try {
      final response = await getHttp('$basePath/$uuid');
      return Album.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<PaginatedResponse<Album>> list({
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

      List<Album> results = response['results']
          .map<Album>((item) => Album.fromJson(item))
          .toList();

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

  Future<Album?> save(Album album) async {
    return album.id != 0 ? _update(album) : _create(album);
  }

  Future<Album?> _create(Album album) async {
    final p = await postHttp(basePath, params: album.toJson());
    return Album.fromJson(p);
  }

  Future<Album?> _update(Album album) async {
    final p = await patchHttp("$basePath/$album.uuid}", params: album.toJson());
    return Album.fromJson(p);
  }

  Future<bool> delete(Album album) async {
    try {
      await deleteHttp("$basePath/$album.uuid}");
      return true;
    } catch (e) {
      return false;
    }
  }
}
