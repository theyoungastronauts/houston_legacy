import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../providers/food_form_provider.dart';
import '../models/food.dart';

part 'food_form.g.dart';

@houstonForm
class FoodForm extends HoustonFoodForm {
  const FoodForm({super.key, required super.uuid});

  @override
  List<Widget> fields(BuildContext context, WidgetRef ref,
      FoodFormProvider provider, Food model) {
    return [
      TextFormField(
        controller: provider.nameController,
        validator: provider.nameValidator,
        decoration: const InputDecoration(label: Text("Name")),
      ),
    ];
  }
}
