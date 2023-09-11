import 'package:annotations/annotations.dart';
import 'package:app/src/core/models/db_list_response.dart';
import 'package:app/src/core/services/db_service.dart';
import 'package:app/src/feature/track/models/track.dart';
import '../../album/services/album_db_service.dart';
part 'track_db_service.g.dart';

@houstonDbService
class TrackDbService extends HoustonTrackDbService {
  @override
  String get defaultSelect => "*,album(${AlbumDbService().defaultSelect})";
}
