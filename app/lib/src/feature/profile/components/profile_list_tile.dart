import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/profile.dart';
import '../../../core/components/base_component.dart';

class ProfileListTile extends BaseComponent {
  final Profile profile;
  const ProfileListTile(this.profile, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(profile.uuid),
      subtitle: Text(profile.uuid),
    );
  }
}
