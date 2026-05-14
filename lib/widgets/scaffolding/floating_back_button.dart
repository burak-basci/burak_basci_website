import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../utils/values/values.dart';

/// Top-left fixed-position back button. Renders as a small dark circle with a
/// chevron-left inside; tapping pops the route (falls back to no-op if no
/// route is on the stack).
///
/// When [controller] is provided, the button slides in from the left and
/// fades up with the page-load animation (matching the SlideBox / underline
/// language used elsewhere on the site). Without a controller it just
/// renders immediately.
class FloatingBackButton extends StatefulWidget {
  const FloatingBackButton({
    super.key,
    this.controller,
    this.color = CustomColors.black,
    this.iconColor = Colors.white,
    this.size = 48,
    this.margin = const EdgeInsets.only(left: 40, top: 120),
  });

  final AnimationController? controller;
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
    final Widget core = MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: () {
          Navigator.maybePop(context);
        },
        // One TweenAnimationBuilder drives the pill width (via the size of
        // its `BACK` child) AND the text reveal (widthFactor + opacity).
        // That way the text slides in *as* the button widens — no jump.
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: _hover ? 1 : 0),
          duration: const Duration(milliseconds: 260),
          curve: Curves.easeOut,
          builder: (context, t, _) {
            return Container(
              height: widget.size,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(widget.size),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 16,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.chevron_left,
                    color: widget.iconColor,
                    size: widget.size * 0.5,
                  ),
                  ClipRect(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      widthFactor: t,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 6),
                        child: Opacity(
                          opacity: t,
                          child: Text(
                            'BACK',
                            style: TextStyle(
                              color: widget.iconColor,
                              fontFamily: StringConst.INTER,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );

    final Widget animated = widget.controller != null
        ? core
            .animate(controller: widget.controller, autoPlay: false)
            .fadeIn(
              duration: const Duration(milliseconds: 600),
              delay: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
            )
            .slideX(
              begin: -0.6,
              end: 0,
              duration: const Duration(milliseconds: 700),
              delay: const Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn,
            )
        : core;

    return Padding(
      padding: widget.margin,
      child: Align(
        alignment: Alignment.topLeft,
        child: animated,
      ),
    );
  }
}
