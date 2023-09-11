import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/base_component.dart';
import '../../../core/components/infinite_list.dart';
import '../components/album_card.dart';
import '../models/album.dart';
import '../providers/album_list_provider.dart';

class AlbumList extends BaseComponent {
  final Function(Album)? onPressed;
  const AlbumList({super.key, this.onPressed});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.read(albumListProvider.notifier);

    return InfiniteList<Album>(
      pagingController: listProvider.pagingController,
      itemBuilder: (context, album, index) =>
          AlbumCard(album, onPressed: onPressed),
      emptyText: "No Albums",
      onRefresh: listProvider.refresh,
    );
  }
}
