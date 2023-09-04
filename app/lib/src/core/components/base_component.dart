import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/screen.dart';

abstract class BaseComponent extends ConsumerWidget {
  const BaseComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (ScreenUtils.size(context)) {
      case ScreenSize.lg:
        return bodyLg(context, ref);
      case ScreenSize.md:
        return bodyMd(context, ref);
      case ScreenSize.sm:
        return body(context, ref);
    }
  }

  Widget body(BuildContext context, WidgetRef ref) {
    return const SizedBox.shrink();
  }

  Widget bodyMd(BuildContext context, WidgetRef ref) {
    return body(context, ref);
  }

  Widget bodyLg(BuildContext context, WidgetRef ref) {
    return bodyMd(context, ref);
  }
}
