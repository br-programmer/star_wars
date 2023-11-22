import 'package:flutter/material.dart';
import 'package:star_wars_ui/star_wars_ui.dart';

class StarWarsBaseModal extends StatelessWidget {
  const StarWarsBaseModal({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  static Future<T?> show<T>(
    BuildContext context,
    WidgetBuilder builder, {
    bool isScrollControlled = false,
  }) {
    return showModalBottomSheet(
      context: context,
      builder: builder,
      isScrollControlled: isScrollControlled,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: borderRadiusT24,
      ),
      child: child,
    );
  }
}
