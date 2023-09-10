// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_form.dart';

// **************************************************************************
// FormGenerator
// **************************************************************************

class HoustonAlbumForm extends BaseComponent {
  final String uuid;
  const HoustonAlbumForm({Key? key, required this.uuid}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(albumFormProvider(uuid).notifier);
    final album = ref.watch(albumFormProvider(uuid));

    return SingleChildScrollView(
      child: Form(
        key: provider.formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: fields(context, ref, provider, album),
          ),
        ),
      ),
    );
  }

  List<Widget> fields(BuildContext context, WidgetRef ref,
      AlbumFormProvider provider, Album model) {
    return [];
  }
}
