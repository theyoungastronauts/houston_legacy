import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../routes.dart';
import '../../../core/components/base_component.dart';
import '../models/album.dart';

class AlbumCard extends BaseComponent {
  final Album album;
  final Function(Album)? onPressed;
  const AlbumCard(this.album, {super.key, this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        if (onPressed != null) {
          onPressed!(album);
          return;
        }

        if (context.mounted) {
          context.push("${AlbumRoutes.namespace}/${album.uuid}");
        }
      },
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(8.0), child: Text(album.title)),
      ),
    );
  }
}
