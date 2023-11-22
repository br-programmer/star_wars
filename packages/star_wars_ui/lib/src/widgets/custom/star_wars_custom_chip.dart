import 'package:flutter/material.dart';
import 'package:star_wars_ui/star_wars_ui.dart';

class StarWarsCustomChip extends StatelessWidget {
  const StarWarsCustomChip({
    Key? key,
    required this.enable,
    required this.onPressed,
    required this.text,
    this.color,
    this.textStyle,
  }) : super(key: key);
  final bool enable;
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final disabledColor = context.darkMode ? Palette.white : Palette.redDark;
    return InkWell(
      onTap: onPressed,
      splashColor: Palette.transparent,
      highlightColor: Palette.transparent,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: enable ? Palette.redLight : Palette.whiteLight,
          ),
          color: color,
          borderRadius: borderRadius16,
          gradient: enable ? Palette.redGradient : null,
        ),
        child: Padding(
          padding: edgeInsetsV8.add(edgeInsetsH16),
          child: Text(
            text,
            style: textStyle ??
                context.textTheme.labelMedium?.copyWith(
                  color: enable ? Palette.white : disabledColor,
                ),
          ),
        ),
      ),
    );
  }
}
