import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/album.dart';
import '../services/album_db_service.dart';

final albumDetailProvider = FutureProvider.family<Album?, String>(
  (ref, String uuid) => AlbumDbService().retrieve(uuid: uuid),
);
