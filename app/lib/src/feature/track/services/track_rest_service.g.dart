// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_rest_service.dart';

// **************************************************************************
// RestServiceGenerator
// **************************************************************************

class HoustonTrackRestService extends RestService {
  String get basePath => "/track";

  Future<Track> retrieve(String uuid) async {
    try {
      final response = await getHttp('$basePath/$uuid');
      return Track.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<PaginatedResponse<Track>> list({
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

      List<Track> results = response['results']
          .map<Track>((item) => Track.fromJson(item))
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

  Future<Track?> save(Track track) async {
    return track.id != 0 ? _update(track) : _create(track);
  }

  Future<Track?> _create(Track track) async {
    final p = await postHttp(basePath, params: track.toJson());
    return Track.fromJson(p);
  }

  Future<Track?> _update(Track track) async {
    final p = await patchHttp("$basePath/$track.uuid}", params: track.toJson());
    return Track.fromJson(p);
  }

  Future<bool> delete(Track track) async {
    try {
      await deleteHttp("$basePath/$track.uuid}");
      return true;
    } catch (e) {
      return false;
    }
  }
}
