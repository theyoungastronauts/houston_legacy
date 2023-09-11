import 'package:annotations/annotations.dart';
import 'package:app/src/core/services/rest_service.dart';
import 'package:app/src/core/models/paginated_response.dart';
import 'package:app/src/core/utils/debugger.dart';
import '../models/track.dart';

part 'track_rest_service.g.dart';

@houstonRestService
class TrackRestService extends HoustonTrackRestService {}
