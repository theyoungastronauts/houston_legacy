import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/profile.dart';
import '../services/profile_db_service.dart';

final profileDetailProvider = FutureProvider.family<Profile?, String>(
  (ref, String uuid) => ProfileDbService().retrieve(uuid: uuid),
);
