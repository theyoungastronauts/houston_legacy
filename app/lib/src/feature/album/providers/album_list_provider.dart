import 'package:annotations/annotations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../models/album.dart';
import '../services/album_db_service.dart';

part 'album_list_provider.g.dart';

@houstonListProvider
class AlbumListProvider extends HoustonAlbumListProvider {}

final albumListProvider = StateNotifierProvider<AlbumListProvider, List<Album>>(
  (ref) => AlbumListProvider(),
);
