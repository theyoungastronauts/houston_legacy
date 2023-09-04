import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

import '../../../config/theme.dart';
import '../../../core/utils/toast.dart';
import '../../../core/components/base_component.dart';
import '../../../core/components/buttons.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_form_provider.dart';


class {{#pascalCase}}{{name}}{{/pascalCase}}FormActions extends BaseComponent {
  final String uuid;
  const {{#pascalCase}}{{name}}{{/pascalCase}}FormActions({
    super.key,
    required this.uuid,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read({{#camelCase}}{{name}}{{/camelCase}}FormProvider(uuid).notifier);
    final model = ref.watch({{#camelCase}}{{name}}{{/camelCase}}FormProvider(uuid));

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
                  AutoRouter.of(context).pop();
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
                          AutoRouter.of(context).popUntil((route) {
                            return route.settings.name == "{{#pascalCase}}{{name}}{{/pascalCase}}ListRoute";
                          });
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
                      AutoRouter.of(context).pop();
                      Toast.message("{{#titleCase}}{{name}}{{/titleCase}} saved successfully!");
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
