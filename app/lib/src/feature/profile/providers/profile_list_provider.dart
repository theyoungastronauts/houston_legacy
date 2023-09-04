import 'package:annotations/annotations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../models/profile.dart';
import '../services/profile_db_service.dart';

part 'profile_list_provider.g.dart';

@houstonListProvider
class ProfileListProvider extends HoustonProfileListProvider {}

final profileListProvider =
    StateNotifierProvider<ProfileListProvider, List<Profile>>(
  (ref) => ProfileListProvider(),
);
