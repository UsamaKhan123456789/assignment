import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.error,
    this.obscureText = false,
    this.obscureTextInitially = false,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.done,
    this.validator,
    this.onTap,
    this.hint,
    this.icon,
    this.maxLines = 1,
    this.minLines = 1,
    this.enabled = true,
    this.initialValue = '',
    this.onChanged,
    this.autoFocus = false,
    this.onSubmitted,
    this.onClear,
    this.inputFormatters = const [],
    this.cursorColor,
    this.prefix,
    this.postfix,
    this.paddingTop = 8,
    this.style,
    this.fillColor = true,
    this.hintStyle,
    this.textFieldHeight = 50, // Set default height
    this.backgroundColor,
    this.borderRadius = 10, // Set default border radius
    this.borderColor,
    this.textAlign,
    this.enableColor,
    this.onEditingComplete,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.onTapOutside,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final String? error;
  final bool obscureText;
  final bool obscureTextInitially;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final FormFieldValidator<String>? validator;
  final Function()? onTap;
  final Widget? icon;
  final Widget? prefix;
  final Widget? postfix;
  final int maxLines;
  final int minLines;
  final bool enabled;
  final String initialValue;
  final ValueChanged<String>? onChanged;
  final bool autoFocus;
  final ValueChanged<String>? onSubmitted;
  final Function()? onClear;
  final List<TextInputFormatter>? inputFormatters;
  final Color? cursorColor;
  final double paddingTop;
  final TextStyle? style;
  final bool fillColor;
  final TextStyle? hintStyle;
  final double textFieldHeight; // Adjusted to be a fixed value
  final Color? backgroundColor;
  final double borderRadius; // Make border radius adjustable
  final Color? borderColor;
  final TextAlign? textAlign;
  final Color? enableColor;
  final void Function()? onEditingComplete;
  final AutovalidateMode autoValidateMode;
  final void Function(PointerDownEvent)? onTapOutside;

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureTextInitially;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) // Display the label above the text field
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0), // Adjust padding
            child: Text(
              widget.label!,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        Container(
          width: double.infinity, // Make width flexible to avoid clipping
          height: widget.textFieldHeight, // Set height
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: widget.borderColor ?? AppColor.borderColor,
              width: 1,
            ),
          ),
          child: TextFormField(
            textAlign: widget.textAlign ?? TextAlign.start,
            controller: widget.controller,
            autofocus: widget.autoFocus,
            initialValue: widget.controller == null ? widget.initialValue : null,
            keyboardType: widget.inputType,
            textInputAction: widget.inputAction,
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.backgroundColor ?? Colors.white,
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: widget.hintStyle ?? TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 18 / 16,
                letterSpacing: -0.165,
                color: AppColor.hintColor
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
              prefixIcon: widget.prefix != null ? widget.prefix : null,
              suffixIcon: widget.postfix != null
                  ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText; // Toggle obscure text
                  });
                },
                child: widget.postfix,
              )
                  : null,
            ),
            cursorColor: widget.cursorColor ?? Colors.grey,
            obscureText: _obscureText,
            style: widget.style,
            validator: widget.validator,
            autovalidateMode: widget.autoValidateMode,
            readOnly: widget.onTap != null,
            onTap: widget.onTap,
            maxLines: widget.maxLines > 1 ? null : 1,
            minLines: widget.minLines > 1 ? widget.minLines : 1,
            enabled: widget.enabled,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onSubmitted,
            inputFormatters: widget.inputFormatters,
            onEditingComplete: widget.onEditingComplete,
            textAlignVertical: TextAlignVertical.center,
            onTapOutside: widget.onTapOutside,
          ),
        ),
      ],
    );
  }
}
