import 'package:annotations/annotations.dart';
import 'package:app/src/core/services/rest_service.dart';
import 'package:app/src/core/models/paginated_response.dart';
import 'package:app/src/core/utils/debugger.dart';
import '../models/album.dart';

part 'album_rest_service.g.dart';

@houstonRestService
class AlbumRestService extends HoustonAlbumRestService {}
