// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_form.dart';

// **************************************************************************
// FormGenerator
// **************************************************************************

class HoustonTrackForm extends BaseComponent {
  final String uuid;
  const HoustonTrackForm({Key? key, required this.uuid}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(trackFormProvider(uuid).notifier);
    final track = ref.watch(trackFormProvider(uuid));

    return SingleChildScrollView(
      child: Form(
        key: provider.formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: fields(context, ref, provider, track),
          ),
        ),
      ),
    );
  }

  List<Widget> fields(BuildContext context, WidgetRef ref,
      TrackFormProvider provider, Track model) {
    return [];
  }
}
