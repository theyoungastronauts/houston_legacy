import 'package:annotations/annotations.dart';
import 'package:app/src/core/models/db_list_response.dart';
import 'package:app/src/core/services/db_service.dart';
import 'package:app/src/feature/album/models/album.dart';

part 'album_db_service.g.dart';

@houstonDbService
class AlbumDbService extends HoustonAlbumDbService {}
