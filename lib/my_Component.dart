import 'package:flutter/material.dart';
import 'package:scienceblog/models/my_colors.dart';

class SciDivider extends StatelessWidget {
  const SciDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}
