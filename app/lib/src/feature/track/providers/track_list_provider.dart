import 'package:annotations/annotations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../models/track.dart';
import '../services/track_db_service.dart';

part 'track_list_provider.g.dart';

@houstonListProvider
class TrackListProvider extends HoustonTrackListProvider {}

final trackListProvider = StateNotifierProvider<TrackListProvider, List<Track>>(
  (ref) => TrackListProvider(),
);
