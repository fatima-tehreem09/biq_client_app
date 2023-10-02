import 'package:flutter/material.dart';

import '../../../utils/color.dart';


class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({
    super.key,
    required this.size,
  });

  final double size;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: widget.size,
      width: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white),
      ),
      child: Icon(
        Icons.add,
        size: 20,
        color: AppColors.greenShade,
      ),
    );
  }
}
