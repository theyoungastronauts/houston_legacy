import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/album.dart';
import '../../../core/components/base_component.dart';

class AlbumListTile extends BaseComponent {
  final Album album;
  const AlbumListTile(this.album, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(album.title),
      subtitle: Text(album.description),
    );
  }
}
