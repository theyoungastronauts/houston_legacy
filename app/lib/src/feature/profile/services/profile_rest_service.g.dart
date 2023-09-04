// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_rest_service.dart';

// **************************************************************************
// RestServiceGenerator
// **************************************************************************

class HoustonProfileRestService extends RestService {
  String get basePath => "/profile";

  Future<Profile> retrieve(String uuid) async {
    try {
      final response = await getHttp('$basePath/$uuid');
      return Profile.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<PaginatedResponse<Profile>> list({
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

      List<Profile> results = response['results']
          .map<Profile>((item) => Profile.fromJson(item))
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

  Future<Profile?> save(Profile profile) async {
    return profile.id != 0 ? _update(profile) : _create(profile);
  }

  Future<Profile?> _create(Profile profile) async {
    final p = await postHttp(basePath, params: profile.toJson());
    return Profile.fromJson(p);
  }

  Future<Profile?> _update(Profile profile) async {
    final p =
        await patchHttp("$basePath/$profile.uuid}", params: profile.toJson());
    return Profile.fromJson(p);
  }

  Future<bool> delete(Profile profile) async {
    try {
      await deleteHttp("$basePath/$profile.uuid}");
      return true;
    } catch (e) {
      return false;
    }
  }
}
