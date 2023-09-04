import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/base_component.dart';
import '../../../core/components/infinite_list.dart';
import '../components/profile_card.dart';
import '../models/profile.dart';
import '../providers/profile_list_provider.dart';

class ProfileList extends BaseComponent {
  const ProfileList({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.read(profileListProvider.notifier);

    return InfiniteList<Profile>(
      pagingController: listProvider.pagingController,
      itemBuilder: (context, profile, index) => ProfileCard(profile),
      emptyText: "No Profiles",
      onRefresh: listProvider.refresh,
    );
  }
}
