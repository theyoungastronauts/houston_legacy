import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../config/theme.dart';
import '../../../core/utils/toast.dart';
import '../../../core/components/base_component.dart';
import '../../../core/components/buttons.dart';
import '../providers/album_form_provider.dart';


class AlbumFormActions extends BaseComponent {
  final String uuid;
  const AlbumFormActions({
    super.key,
    required this.uuid,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(albumFormProvider(uuid).notifier);
    final model = ref.watch(albumFormProvider(uuid));

    return Container(
      color: Colors.black38,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppButton(
              label: "Cancel",
              variant: AppColorVariant.light,
              type: AppButtonType.Text,
              onPressed: () async {
                final confirmed = await provider.discard();
                if (confirmed) {
                  context.pop();
                }
              },
            ),
            Row(
              children: [
                if (model.exists)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: AppButton(
                      label: "Delete",
                      variant: AppColorVariant.danger,
                      onPressed: () async {
                        final success = await provider.delete();
                        if (success == true) {
                          context.pop();
                          context.pop();
                        }
                      },
                    ),
                  ),
                AppButton(
                  label: "Save",
                  variant: AppColorVariant.success,
                  onPressed: () async {
                    final success = await provider.submit();
                    if(success == true){
                      context.pop();
                      Toast.message("Album saved successfully!");
                    }

                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
