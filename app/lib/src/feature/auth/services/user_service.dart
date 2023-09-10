import 'package:app/src/core/services/db_service.dart';
import 'package:app/src/core/utils/debugger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserService extends DbService {
  Future<User?> updateMe({
    String? email,
    String? password,
    String? phone,
    Map<String, dynamic>? data,
    String? emailRedirectTo,
  }) async {
    if (email == null && password == null && phone == null && data == null) {
      Debugger.warning("All fields are null when trying to update a user.");
      return null;
    }

    final response = await Supabase.instance.client.auth.updateUser(
      UserAttributes(
        email: email,
        password: password,
        phone: phone,
        data: data,
      ),
      emailRedirectTo: emailRedirectTo,
    );

    return response.user;
  }
}
