// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

/// Widget that represents a gap with either a specific width or height based on orientation.
///
/// The `Gap` widget can be used to create vertical or horizontal gaps in the layout.
/// If `isVertical` is true, it creates a vertical gap with the specified `height`.
/// If `isVertical` is false, it creates a horizontal gap with the specified `width`.
class Gap extends StatelessWidget {
  final double? width;
  final double? height;
  final bool isVertical;

  const Gap({
    super.key,
    this.width,
    this.height,
    this.isVertical = true,
  });

  @override
  Widget build(BuildContext context) {
    return isVertical ? SizedBox(height: height) : SizedBox(width: width);
  }
}
