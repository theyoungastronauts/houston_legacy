import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/album.dart';
import '../../../core/components/base_component.dart';


class AlbumDetails extends BaseComponent {
  final Album album;
  const AlbumDetails(this.album, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(album.title),
      ],
    );
  }
}