import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/track.dart';
import '../../../core/components/base_component.dart';


class TrackDetails extends BaseComponent {
  final Track track;
  const TrackDetails(this.track, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(track.title),
      ],
    );
  }
}