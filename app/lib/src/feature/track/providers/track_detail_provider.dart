import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/track.dart';
import '../services/track_db_service.dart';

final trackDetailProvider = FutureProvider.family<Track?, String>(
  (ref, String uuid) => TrackDbService().retrieve(uuid: uuid),
);
