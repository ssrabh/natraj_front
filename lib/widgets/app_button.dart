import 'package:flutter/material.dart';
import 'package:front_flutter/core/app_color/hero_page_color.dart';

enum ButtonVariant {
  primary,
  secondary,
  outlined,
}

class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final double? width;
  final double? height;
  final double borderRadius;
  final EdgeInsets padding;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.width,
    this.height,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
    this.textStyle,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final bool isPrimary = widget.variant == ButtonVariant.primary;
    final bool isSecondary = widget.variant == ButtonVariant.secondary;
    // final bool isOutlined = widget.variant == ButtonVariant.outlined;

    // 🎨 Colors and style logic
    Color backgroundColor;
    Color borderColor;
    Color textColor;

    if (isPrimary) {
      backgroundColor = _isHovered
          ? HeroPageColor.primary.withOpacity(0.9)
          : HeroPageColor.primary;
      borderColor = Colors.transparent;
      textColor = HeroPageColor.light;
    } else if (isSecondary) {
      backgroundColor = _isHovered
          ? Colors.white.withOpacity(0.95)
          : Colors.white.withOpacity(0.9);
      borderColor = _isHovered ? HeroPageColor.primary : Colors.transparent;
      textColor =
          _isHovered ? HeroPageColor.primary : HeroPageColor.backgroundOverlay;
    } else {
      backgroundColor = Colors.transparent;
      borderColor =
          _isHovered ? HeroPageColor.primary : HeroPageColor.lightText;
      textColor = _isHovered ? HeroPageColor.primary : HeroPageColor.lightText;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onPressed, // ✅ now actually triggers
        child: AnimatedScale(
          duration: const Duration(milliseconds: 150),
          scale: _isHovered
              ? 1.05
              : _isPressed
                  ? 0.98
                  : 1.0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: widget.width,
            height: widget.height,
            padding: widget.padding,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(color: borderColor, width: 2),
              boxShadow: _isHovered && isPrimary
                  ? [
                      BoxShadow(
                        color: HeroPageColor.primary.withOpacity(0.35),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ]
                  : [],
            ),
            alignment: Alignment.center,
            child: Text(
              widget.text,
              style: widget.textStyle ??
                  TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
