import 'package:annotations/annotations.dart';
import 'package:app/src/core/services/rest_service.dart';
import 'package:app/src/core/models/paginated_response.dart';
import 'package:app/src/core/utils/debugger.dart';
import '../models/profile.dart';

part 'profile_rest_service.g.dart';

@houstonRestService
class ProfileRestService extends HoustonProfileRestService {}
