import 'package:app/src/core/utils/debugger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class DbService {
  String get table => throw UnimplementedError("DbService table not implemented");

  String get defaultSelect => "*";

  Future<PostgrestResponse> listData(int page, {int limit = 10, String? select}) async {
    try {
      return await Supabase.instance.client
          .from(table)
          .select(
            select ?? defaultSelect,
            const FetchOptions(count: CountOption.exact),
          )
          .range((page - 1) * limit, limit * page);
    } catch (e, st) {
      Debugger.error("Error in listData", e, st);
      return const PostgrestResponse(data: [], status: 400);
    }
  }

  Future<dynamic> retrieveData({required String column, required String value, String? select}) async {
    return await Supabase.instance.client.from(table).select(select ?? defaultSelect).eq(column, value).single();
  }

  Future<dynamic> retrieveDataByIdentifier({int? id, String? uuid, String? select}) async {
    if (id != null) {
      return await retrieveData(column: "id", value: id.toString(), select: select ?? defaultSelect);
    }

    if (uuid != null) {
      return await retrieveData(column: "uuid", value: uuid, select: select ?? defaultSelect);
    }

    return null;
  }

  Future<dynamic> insertData(Map<String, dynamic> data) async {
    return await Supabase.instance.client.from(table).insert(data).select(defaultSelect).single();
  }

  Future<dynamic> updateData(int id, Map<String, dynamic> data) async {
    return await Supabase.instance.client.from(table).update(data).match({"id": id}).select(defaultSelect).single();
  }

  Future<bool> deleteData(int id) async {
    try {
      await Supabase.instance.client.from(table).delete().match({"id": id});
      return true;
    } catch (e, st) {
      Debugger.error("Delete error", e, st);
      return false;
    }
  }
}
