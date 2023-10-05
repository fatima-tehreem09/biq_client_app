import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/color.dart';
import 'custom_image_picker_dialog.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({
    super.key,
    required this.size,
    required this.onImageSelection,
  });

  final double size;
  final void Function(XFile?) onImageSelection;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  Future<void> imageSelection(ImageSource imageSource, int selection) async {
    try {
      xFile = await ImagePicker().pickImage(
        source: imageSource,
        imageQuality: 30,
        preferredCameraDevice: CameraDevice.rear,
        maxHeight: 800,
        maxWidth: 1000,
      );
      setState(() {});
      widget.onImageSelection(xFile);
    } catch (e) {
      // showToastError("Couldn't select image $e", FToast().init(context));
    }
  }

  XFile? xFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white),
      ),
      child: xFile != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(widget.size),
              child: Image.file(
                File(xFile!.path),
                fit: BoxFit.cover,
              ),
            )
          : GestureDetector(
              onTap: () {
                CustomDialogBox(
                  name: '',
                  onCameraBTNPressed: () {
                    imageSelection(ImageSource.camera, 0);
                  },
                  onGalleryBTNPressed: () {
                    imageSelection(ImageSource.gallery, 0);
                  },
                ).show(context);
              },
              child: Icon(
                Icons.add,
                size: 20,
                color: AppColors.greenShade,
              ),
            ),
    );
  }
}
