import 'dart:io';

import 'package:app/src/config/env.dart';
import 'package:app/src/core/utils/strings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UploadService {
  String get defaultBucket => "uploads";

  uploadFile(File file, {String? bucket}) async {
    final ext = file.path.split(".").last.toLowerCase();
    final key = "${generateRandomString(16)}.$ext";

    final path = await Supabase.instance.client.storage.from(bucket ?? defaultBucket).upload(
          key,
          file,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );

    final url = "https://${Env.supabaseProject}.supabase.co/storage/v1/object/public/$path";
    return url;
  }
}
