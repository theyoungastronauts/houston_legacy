import 'dart:io';

import 'package:app/src/config/env.dart';
import 'package:dio/dio.dart';

class RestService {
  Map<String, dynamic> headers({bool auth = true}) {
    return {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
      'apikey': Env.supabaseAnonKey,
      'Authorization': "Bearer ${Env.supabaseAnonKey}",
    };
  }

  BaseOptions options({bool auth = true}) {
    return BaseOptions(
      baseUrl: "https://${Env.supabaseProject}.supabase.co/rest/v1",
      headers: headers(auth: auth),
    );
  }

  cleanPath(String path) {
    if (!path.endsWith("/")) {
      return "$path/";
    }
    return path;
  }

  Map<String, dynamic> buildPage(int page) {
    return {'page': page};
  }

  Map<String, dynamic> buildOffset(int page, int limit) {
    return {'offset': (page * limit) - limit};
  }

  Map<String, dynamic> buildLimit(int limit) {
    return {'limit': limit};
  }

  Future<Map<String, dynamic>> getHttp(
    String path, {
    Map<String, dynamic> params = const {},
    bool auth = true,
  }) async {
    try {
      var response = await Dio(options(auth: auth)).get(
        cleanPath(path),
        queryParameters: params,
      );

      if (response.statusCode == 204) {
        return {};
      }
      if (response.data == null) {
        return {};
      }
      if (response.data.runtimeType == String) {
        return {};
      }

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> postHttp(
    String path, {
    Map<String, dynamic> params = const {},
    bool auth = true,
  }) async {
    try {
      var response = await Dio(options(auth: auth)).post(
        cleanPath(path),
        data: params,
      );

      if (response.statusCode == 204) {
        return {};
      }
      if (response.data == null) {
        return {};
      }

      if (response.data.runtimeType == String) {
        return {};
      }
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> patchHttp(
    String path, {
    Map<String, dynamic> params = const {},
    bool auth = true,
  }) async {
    try {
      var response = await Dio(options(auth: auth)).patch(
        cleanPath(path),
        data: params,
      );
      if (response.statusCode == 204) {
        return {};
      }
      if (response.data == null) {
        return {};
      }
      if (response.data.runtimeType == String) {
        return {};
      }

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> putHttp(
    String path, {
    Map<String, dynamic> params = const {},
    bool auth = true,
  }) async {
    try {
      var response = await Dio(options(auth: auth)).put(
        cleanPath(path),
        data: params,
      );
      if (response.statusCode == 204) {
        return {};
      }
      if (response.data == null) {
        return {};
      }
      if (response.data.runtimeType == String) {
        return {};
      }
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> deleteHttp(
    String path, {
    bool auth = true,
  }) async {
    try {
      var response = await Dio(options(auth: auth)).delete(
        cleanPath(path),
      );

      if (response.statusCode == 204) {
        return {};
      }
      if (response.data == null) {
        return {};
      }
      if (response.data.runtimeType == String) {
        return {};
      }

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
