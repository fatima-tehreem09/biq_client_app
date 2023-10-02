import 'package:biq/src/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatefulWidget {
  AppTextField({
    Key? key,
    this.hint,
    this.label,
    this.validator,
    this.keyboardType,
    this.textEditingController,
    this.suffix,
    this.readOnly,
    this.prefix,
    this.onCountryTap,
    BuildContext? context,
    this.onTap,
    this.textFieldUpperText
  }) : super(key: key);

  // final bool obscure;
  final String? hint;
  final String? label;
  String? suffix;
  String? prefix;
  bool? readOnly;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? textEditingController;
  final VoidCallback? onCountryTap;
  final String? textFieldUpperText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          const EdgeInsets.only(left: 5, bottom: 10),
          child: Row(
            children: [
              Text(
                '${widget.textFieldUpperText}',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white),
              ),
            ],
          ),
        ),
        TextFormField(
          readOnly: widget.readOnly ?? false,
          style: GoogleFonts.poppins(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          onTap: widget.onTap,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          controller: widget.textEditingController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(

            prefix: widget.prefix == null
                ? const SizedBox()
                : Text(
                    widget.prefix!,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 21,
                    ),
                  ),
            suffix: widget.suffix == null
                ? const SizedBox()
                : GestureDetector(
                    onTap: () {
                      widget.onCountryTap!();
                      setState(() {});
                    },
                    child: Image.asset(
                      'assets/flags/${widget.suffix!}.png',
                      width: 32,
                    ),
                  ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: AppColors.lightBlack, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),

              borderSide: BorderSide(color: AppColors.lightBlack, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),

              borderSide: BorderSide(color: AppColors.lightBlack, width: 1),
            ),
            labelText: widget.label,
            hintText: widget.hint,
            hintStyle: GoogleFonts.poppins(color: AppColors.white, fontSize: 12),
            labelStyle: GoogleFonts.poppins(
                color: Colors.black.withOpacity(0.4),
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
          cursorColor: Colors.grey,
        ),
      ],
    );
  }
}

class AppPasswordField extends StatefulWidget {
  final IconData? icon;
  final String? hint;

  // final bool iconBool;
  final String? label;
  final BuildContext? context;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? textEditingController;

  const AppPasswordField(
      {Key? key,
      this.icon,
      this.label,
      this.validator,
      this.hint,
      this.context,
      // required this.iconBool,
      this.textEditingController // this.validator,
      })
      : super(key: key);

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _show = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator: widget.validator,
        obscureText: _show,
        controller: widget.textEditingController,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (v) {
          FocusScope.of(context).nextFocus();
        },
        style: const TextStyle(),
        scrollPadding: const EdgeInsets.all(180),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            child: Icon(
              _show ? Icons.visibility_off : Icons.visibility,
              color: _show ? Colors.grey : Colors.black,
            ),
            onTap: () => setState(
              () => _show = !_show,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightBlack, width: 1),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightBlack, width: 1),
          ),
          labelText: widget.label,
          labelStyle: GoogleFonts.lato(
              color: Colors.black.withOpacity(0.4),
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
      ),
    );
  }
}

class BorderWidget extends StatelessWidget {
  const BorderWidget({
    Key? key,
    this.gradientColors = const [
      Colors.white,
      Color(0xFFD6E3F3),
    ],
    required this.child,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
    this.stops,
    this.borderWidth = 1,
    this.borderRadius = 10,
    this.isCircled = false,
  }) : super(key: key);

  final List<Color> gradientColors;
  final Widget child;
  final Alignment begin;
  final Alignment end;
  final List<double>? stops;
  final double borderWidth;
  final double borderRadius;
  final bool isCircled;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: isCircled ? null : BorderRadius.circular(borderRadius),
        shape: isCircled ? BoxShape.circle : BoxShape.rectangle,
        // gradient: LinearGradient(
        //   begin: begin,
        //   end: end,
        //   stops: stops,
        //   // colors: gradientColors,
        // ),
      ),
      padding: EdgeInsets.all(borderWidth),
      child: child,
    );
  }
}
