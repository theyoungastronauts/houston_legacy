import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/base_component.dart';
import '../../../core/components/infinite_list.dart';
import '../components/track_card.dart';
import '../models/track.dart';
import '../providers/track_list_provider.dart';

class TrackList extends BaseComponent {
  final Function(Track)? onPressed;
  const TrackList({super.key, this.onPressed});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.read(trackListProvider.notifier);

    return InfiniteList<Track>(
      pagingController: listProvider.pagingController,
      itemBuilder: (context, track, index) =>
          TrackCard(track, onPressed: onPressed),
      emptyText: "No Tracks",
      onRefresh: listProvider.refresh,
    );
  }
}
