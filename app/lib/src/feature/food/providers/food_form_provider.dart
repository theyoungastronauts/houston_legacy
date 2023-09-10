import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/dialogs.dart';
import '../../../core/utils/toast.dart';
import '../../../core/utils/validation.dart';

import '../../../core/providers/global_loading_provider.dart';
import '../models/food.dart';
import '../services/food_db_service.dart';
import 'food_detail_provider.dart';
import 'food_list_provider.dart';
import '../../../core/providers/session_provider.dart';

part 'food_form_provider.g.dart';

@houstonFormProvider
class FoodFormProvider extends HoustonFoodFormProvider {
  FoodFormProvider(ref, uuid, initialState) : super(ref, uuid, initialState);

  final TextEditingController nameController = TextEditingController();

  String? nameValidator(String? value) => formValidatorNotEmpty(value, "Name");

  @override
  void fieldListeners() {
    nameController.addListener(() {
      changesMade = true;
      state = state.copyWith(name: nameController.text);
    });
  }

  @override
  void setFields() {
    nameController.text = state.name;
  }

  @override
  void clearFields() {
    nameController.text = '';
  }

  @override
  void handleEmpty() {
    final profile = ref.read(sessionProvider).profile;
    if (profile != null) {
      state = Food.empty().copyWith(profile: profile);
    }
  }
}

final foodFormProvider =
    StateNotifierProvider.family<FoodFormProvider, Food, String>((ref, uuid) {
  return FoodFormProvider(ref, uuid, Food.empty());
});
