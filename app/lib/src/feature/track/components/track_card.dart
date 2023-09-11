import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../routes.dart';
import '../../../core/components/base_component.dart';
import '../models/track.dart';

class TrackCard extends BaseComponent {
  final Track track;
  final Function(Track)? onPressed;
  const TrackCard(this.track, {super.key, this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        if (onPressed != null) {
          onPressed!(track);
          return;
        }

        if (context.mounted) {
          context.push("${TrackRoutes.namespace}/${track.uuid}");
        }
      },
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(8.0), child: Text(track.title)),
      ),
    );
  }
}
