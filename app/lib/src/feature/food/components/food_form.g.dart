// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_form.dart';

// **************************************************************************
// FormGenerator
// **************************************************************************

class HoustonFoodForm extends BaseComponent {
  final String uuid;
  const HoustonFoodForm({Key? key, required this.uuid}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(foodFormProvider(uuid).notifier);
    final food = ref.watch(foodFormProvider(uuid));

    return SingleChildScrollView(
      child: Form(
        key: provider.formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: fields(context, ref, provider, food),
          ),
        ),
      ),
    );
  }

  List<Widget> fields(BuildContext context, WidgetRef ref,
      FoodFormProvider provider, Food model) {
    return [];
  }
}
