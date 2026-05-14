import 'package:flutter/material.dart';

import '../../utils/values/values.dart';

/// Top-left fixed-position back button. Renders as a small dark circle with a
/// chevron-left inside; tapping pops the route (falls back to no-op if no
/// route is on the stack).
class FloatingBackButton extends StatefulWidget {
  const FloatingBackButton({
    super.key,
    this.color = CustomColors.black,
    this.iconColor = Colors.white,
    this.size = 48,
    this.margin = const EdgeInsets.only(left: 24, top: 24),
  });

  final Color color;
  final Color iconColor;
  final double size;
  final EdgeInsets margin;

  @override
  State<FloatingBackButton> createState() => _FloatingBackButtonState();
}

class _FloatingBackButtonState extends State<FloatingBackButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: Align(
        alignment: Alignment.topLeft,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _hover = true),
          onExit: (_) => setState(() => _hover = false),
          child: GestureDetector(
            onTap: () {
              Navigator.maybePop(context);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOut,
              width: _hover ? widget.size + 6 : widget.size,
              height: _hover ? widget.size + 6 : widget.size,
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.circle,
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 16,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.chevron_left,
                color: widget.iconColor,
                size: widget.size * 0.6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
