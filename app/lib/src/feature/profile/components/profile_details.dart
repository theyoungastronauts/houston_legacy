import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/profile.dart';
import '../../../core/components/base_component.dart';


class ProfileDetails extends BaseComponent {
  final Profile profile;
  const ProfileDetails(this.profile, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(profile.uuid),
      ],
    );
  }
}