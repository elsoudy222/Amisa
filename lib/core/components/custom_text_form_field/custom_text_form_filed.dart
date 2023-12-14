
import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:flutter/services.dart';


// ignore: must_be_immutable
class TextFormFieldsCustom extends StatefulWidget {
  final int? errorMaxLines;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  bool? isPassword;
  final TextInputType? keyboardType;
  final String? helperText;
  final String initialValue;
  final Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool? suffix;
  final bool? suffixToggle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? suffixIconColor;
  final IconData? suffixIconToggle;
  final Color? suffixIconColorToggle;
  final Function()? suffixOnPressed;
  final Function()? onTap;
  final FocusNode? focus;
  final Function(String?)? onChanged;
  final bool? readOnly;
  final bool? enabled;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatter;

  TextFormFieldsCustom({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.helperText,
    this.isPassword = false,
    this.initialValue = "",
    this.onEditingComplete,
    this.textInputAction,
    this.controller,
    this.suffix = false,
    this.suffixToggle = false,
    this.suffixIcon,
    this.suffixIconColor = Colors.grey,
    this.suffixIconToggle,
    this.suffixIconColorToggle = Colors.grey,
    this.suffixOnPressed,
    this.focus,
    this.onChanged,
    // required bool enableInteractive,
    this.errorMaxLines,
    this.readOnly,
    this.enabled,
    this.inputFormatter,
    this.onTap,
    this.maxLength
  });

  @override
  State<TextFormFieldsCustom> createState() => _TextFormFieldsCustomState();
}

class _TextFormFieldsCustomState extends State<TextFormFieldsCustom> {
  // const TextFormFieldsCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      // maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatter,
      // autofocus: false,
      readOnly: widget.readOnly ?? false,
      enabled: widget.enabled ?? true,
      // enableInteractiveSelection: false,
      controller: widget.controller,
      // focusNode: widget.focus,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      // prevent text from being automatically selected
      // onEditingComplete: widget.onEditingComplete,
      onChanged: (value) {
         widget.onChanged!(value);
        // widget.onChanged != null ? widget.onChanged!(value) : null;
      },
      style: const TextStyle(color:  Colors.white ),
      cursorColor: Colors.white,
      // cursorHeight: 20,
      cursorWidth: 1.5,
      decoration: InputDecoration(
        errorMaxLines: widget.errorMaxLines,
        fillColor:  Colors.transparent ,
        filled: true,
        isDense: true,
        hintText: widget.hintText,
        helperText: widget.helperText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,

        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintStyle:  TextStyle(
          fontSize: 15.sp,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.r),
          borderSide: const BorderSide(color: AppColors.white)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.r),
          borderSide:  const BorderSide(
            color:  AppColors.white,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.r),
          borderSide: const BorderSide(
            color: AppColors.white,
          ),
        ),
        // errorBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         // color: Colors.red,
        //         color: Colors.transparent),
        //     borderRadius: BorderRadius.circular(10)),
        // focusedErrorBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         // color: Colors.red,
        //         color: Colors.transparent),
        //     borderRadius: BorderRadius.circular(10)),
      ),
      obscureText: widget.isPassword!,
      obscuringCharacter: '*',
      validator: widget.validator,
      onSaved: (value) {
        // widget.onSaved != null ? widget.onSaved!(value) : null;
      },
      keyboardType: widget.keyboardType,
    );
  }
}
