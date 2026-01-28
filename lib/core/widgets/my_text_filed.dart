import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefix; // يدعم الـ Country Code أو أي Widget
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final bool filled;
  final Color? fillColor;
  final bool showClearButton;

  const MyTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefix,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.inputFormatters,
    this.focusNode,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.contentPadding,
    this.filled = true,
    this.fillColor,
    this.showClearButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;
    final Color currentColor = isDark ? Colors.white : Colors.black;
    final Color borderColor = isDark ? Colors.grey[800]! : Colors.grey[300]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // الليبل مع النجمة الحمراء لو موجود
        if (labelText != null) ...[
          RichText(
            text: TextSpan(
              text: '* ',
              style: const TextStyle(color: Colors.red, fontSize: 16),
              children: [
                TextSpan(
                  text: labelText,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white70 : Colors.black87,
                    fontFamily: textTheme.bodyMedium?.fontFamily,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],

        TextFormField(
          cursorColor: currentColor,
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          onTap: onTap,
          enabled: enabled,
          readOnly: readOnly,
          maxLines: obscureText ? 1 : maxLines,
          minLines: minLines,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          autofocus: autofocus,
          textCapitalization: textCapitalization,
          textAlign: textAlign,
          style: textTheme.bodyMedium?.copyWith(
            color: enabled
                ? (isDark ? Colors.white : Colors.black)
                : Colors.grey,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            helperText: helperText,
            errorText: errorText,

            // إضافة كود الدولة مع الخط الفاصل لو الـ prefix موجود
            prefixIcon: prefix != null
                ? IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        prefix!,
                        Container(
                          width: 1,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: borderColor,
                        ),
                      ],
                    ),
                  )
                : null,

            suffixIcon: _buildSuffixIcon(context),
            filled: filled,
            fillColor: fillColor ?? Colors.transparent,
            contentPadding:
                contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

            // شكل الحدود (Border) زي الصورة
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: currentColor, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
          ),
        ),
      ],
    );
  }

  Widget? _buildSuffixIcon(BuildContext context) {
    if (suffixIcon != null) return suffixIcon;
    return null;
  }
}
