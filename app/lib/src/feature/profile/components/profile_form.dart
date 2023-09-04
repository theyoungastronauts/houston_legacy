import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../providers/profile_form_provider.dart';
import '../models/profile.dart';

part 'profile_form.g.dart';

@houstonForm
class ProfileForm extends HoustonProfileForm {
  const ProfileForm({super.key, required super.uuid});

  @override
  List<Widget> fields(BuildContext context, WidgetRef ref,
      ProfileFormProvider provider, Profile model) {
    return [
      TextFormField(
        controller: provider.avatarController,
        validator: provider.avatarValidator,
        decoration: const InputDecoration(label: Text("Avatar")),
      ),
      TextFormField(
        controller: provider.bioController,
        validator: provider.bioValidator,
        decoration: const InputDecoration(label: Text("Bio")),
        minLines: 3,
        maxLines: 3,
      ),
    ];
  }
}
