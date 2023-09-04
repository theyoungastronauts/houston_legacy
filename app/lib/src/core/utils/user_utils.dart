import 'package:supabase_flutter/supabase_flutter.dart';

User userFromJson(Map<String, dynamic> json) {
  return User.fromJson(json) ??
      User(
        id: "",
        appMetadata: {},
        userMetadata: {},
        aud: "",
        createdAt: DateTime.now().toString(),
      );
}

Map<String, dynamic> userToJson(User user) {
  return {};
}

User emptyUser() {
  return User(
    id: "",
    appMetadata: {},
    userMetadata: {},
    aud: "",
    createdAt: DateTime.now().toString(),
  );
}
