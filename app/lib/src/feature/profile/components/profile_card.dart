import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/base_component.dart';
import '../models/profile.dart';

class ProfileCard extends BaseComponent {
  final Profile profile;
  const ProfileCard(this.profile, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        context.push('/profile/${profile.uuid}');
      },
      child: Card(
        child: Padding(padding: const EdgeInsets.all(8.0), child: Text(profile.uuid)),
      ),
    );
  }
}
