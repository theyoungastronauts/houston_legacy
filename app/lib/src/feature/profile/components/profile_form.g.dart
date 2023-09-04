// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_form.dart';

// **************************************************************************
// FormGenerator
// **************************************************************************

class HoustonProfileForm extends BaseComponent {
  final String uuid;
  const HoustonProfileForm({Key? key, required this.uuid}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(profileFormProvider(uuid).notifier);
    final profile = ref.watch(profileFormProvider(uuid));

    return SingleChildScrollView(
      child: Form(
        key: provider.formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: fields(context, ref, provider, profile),
          ),
        ),
      ),
    );
  }

  List<Widget> fields(BuildContext context, WidgetRef ref,
      ProfileFormProvider provider, Profile model) {
    return [];
  }
}
