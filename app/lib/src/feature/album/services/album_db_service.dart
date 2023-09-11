import 'package:annotations/annotations.dart';
import 'package:app/src/core/models/db_list_response.dart';
import 'package:app/src/core/services/db_service.dart';
import 'package:app/src/feature/album/models/album.dart';
import '../../profile/services/profile_db_service.dart';
part 'album_db_service.g.dart';

@houstonDbService
class AlbumDbService extends HoustonAlbumDbService {
  @override
  String get defaultSelect => "*,profile(${ProfileDbService().defaultSelect})";
}
