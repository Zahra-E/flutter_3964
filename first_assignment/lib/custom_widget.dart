import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final IconData? icon;
  final String placeholderText;
  final bool visibilityToggle;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    this.icon,
    required this.placeholderText,
    this.visibilityToggle = false,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.visibilityToggle ? _isObscured : widget.obscureText,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        style: TextStyle(
          color: theme.textTheme.bodyLarge?.color,
        ),
        decoration: InputDecoration(
          labelText: widget.placeholderText,
          labelStyle: TextStyle(
            color: theme.hintColor,
          ),
          prefixIcon: widget.icon != null
              ? Icon(
                  widget.icon,
                  color: theme.hintColor,
                )
              : null,
          suffixIcon: widget.visibilityToggle
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                    color: theme.hintColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null,
          filled: true,
          fillColor: theme.inputDecorationTheme.fillColor ?? 
                     (isDark ? Colors.grey[800] : Colors.grey[50]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: theme.dividerColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: theme.dividerColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: theme.colorScheme.error,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: theme.colorScheme.error,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final TextStyle? textStyle;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.width,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? theme.colorScheme.error,
          foregroundColor: textColor ?? Colors.white,
          fixedSize: height != null ? Size.fromHeight(height!) : null,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle?.copyWith(color: textColor) ?? 
                 TextStyle(color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}