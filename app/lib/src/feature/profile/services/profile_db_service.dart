import 'package:annotations/annotations.dart';
import 'package:app/src/core/models/db_list_response.dart';
import 'package:app/src/core/services/db_service.dart';
import 'package:app/src/feature/profile/models/profile.dart';

part 'profile_db_service.g.dart';

@houstonDbService
class ProfileDbService extends HoustonProfileDbService {}
