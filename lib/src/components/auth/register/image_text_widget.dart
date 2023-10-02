import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color.dart';

class ImageTextWidget extends StatefulWidget {
  const ImageTextWidget({super.key});

  @override
  State<ImageTextWidget> createState() => _ImageTextWidgetState();
}

class _ImageTextWidgetState extends State<ImageTextWidget> {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Profile Picture',
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.white),
          ),
          const SizedBox(height: 10),
          Text(
            'Nemo enim ipsam voluptatem quia voluptas sit',
            style: GoogleFonts.poppins(
                fontSize: 12, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
