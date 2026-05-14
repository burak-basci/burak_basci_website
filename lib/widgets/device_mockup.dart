import 'package:flutter/material.dart';

import '../utils/values/values.dart';

/// Cinematic device-frame wrapper for project screenshots.
///
/// `type` switches the visual frame:
///   - 'phone'        rounded-corner iPhone-style bezel with a notch
///   - 'laptop'       MacBook-style frame with a hinge sliver
///   - 'fullbleed'    no frame, just a soft shadow + rounded corners
///   - 'terminal'     window chrome with three traffic-light dots
///   - 'unreal-still' letter-boxed, slight grain, no bezel
///
/// The mockup is interactive: it floats with a subtle base tilt, and
/// follows the mouse pointer with a 3D perspective rotation. Drop the
/// pointer to ease back to the resting tilt. Pass `tiltLeft: true` to
/// flip the resting tilt direction (useful for mirrored galleries).
class DeviceMockup extends StatefulWidget {
  const DeviceMockup({
    required this.imageAsset,
    this.type = 'phone',
    this.tiltLeft = false,
    this.maxHeight = 540,
    this.maxWidth = 920,
    super.key,
  });

  final String imageAsset;
  final String type;
  final bool tiltLeft;
  final double maxHeight;
  final double maxWidth;

  @override
  State<DeviceMockup> createState() => _DeviceMockupState();
}

class _DeviceMockupState extends State<DeviceMockup> {
  // Position of the pointer relative to the widget's centre, normalised
  // to [-1, 1] on each axis. (0, 0) = pointer at centre. Outside the
  // widget = (0, 0) so the mockup eases back to the resting tilt.
  Offset _ptr = Offset.zero;
  Size? _size;

  static const double _baseTiltY = 0.06; // resting Y rotation (radians)
  static const double _baseTiltX = 0.04; // resting X rotation (radians)
  static const double _hoverGainY = 0.18; // max additional Y on mouse-track
  static const double _hoverGainX = 0.12; // max additional X on mouse-track

  @override
  Widget build(BuildContext context) {
    final Widget frame;
    switch (widget.type) {
      case 'phone':
        frame = _phoneFrame();
        break;
      case 'laptop':
        frame = _laptopFrame();
        break;
      case 'terminal':
        frame = _terminalFrame();
        break;
      case 'unreal-still':
        frame = _unrealFrame();
        break;
      case 'fullbleed':
      default:
        frame = _fullBleed();
    }

    // Resting tilt direction.
    final double restY = widget.tiltLeft ? _baseTiltY : -_baseTiltY;
    final double restX = _baseTiltX;
    // Mouse drives an *additional* tilt on top of the resting one.
    // Inverted X axis on rotateY so the side closer to the pointer
    // tilts toward the viewer (intuitive parallax).
    final double rotY = restY + (-_ptr.dx * _hoverGainY);
    final double rotX = restX + (_ptr.dy * _hoverGainX);

    return Center(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: widget.maxWidth, maxHeight: widget.maxHeight),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return MouseRegion(
              onEnter: (event) => _onMove(event.localPosition, constraints),
              onExit: (_) => setState(() => _ptr = Offset.zero),
              onHover: (event) => _onMove(event.localPosition, constraints),
              child: TweenAnimationBuilder<Offset>(
                tween: Tween<Offset>(begin: Offset.zero, end: _ptr),
                duration: const Duration(milliseconds: 240),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  final double smoothRotY =
                      restY + (-value.dx * _hoverGainY);
                  final double smoothRotX =
                      restX + (value.dy * _hoverGainX);
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.0011) // a touch more perspective
                      ..rotateY(smoothRotY)
                      ..rotateX(smoothRotX),
                    child: child,
                  );
                },
                child: frame,
              ),
            );
          },
        ),
      ),
    );
  }

  void _onMove(Offset local, BoxConstraints constraints) {
    final double w = constraints.maxWidth;
    final double h = constraints.maxHeight.isFinite
        ? constraints.maxHeight
        : widget.maxHeight;
    // Clamp into [-1, 1].
    final double nx = ((local.dx / w) * 2 - 1).clamp(-1.0, 1.0);
    final double ny = ((local.dy / h) * 2 - 1).clamp(-1.0, 1.0);
    setState(() {
      _size = Size(w, h);
      _ptr = Offset(nx, ny);
    });
  }

  Widget _phoneFrame() {
    return AspectRatio(
      aspectRatio: 9 / 19.5,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(44),
          boxShadow: const <BoxShadow>[
            BoxShadow(color: Color(0x33000000), blurRadius: 40, offset: Offset(0, 24)),
            BoxShadow(color: Color(0x22000000), blurRadius: 16, offset: Offset(0, 6)),
          ],
          border: Border.all(color: const Color(0xFF1A1A1A), width: 3),
        ),
        padding: const EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(38),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.asset(widget.imageAsset, fit: BoxFit.cover),
              ),
              Positioned(
                top: 8,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 88,
                    height: 22,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _laptopFrame() {
    return AspectRatio(
      aspectRatio: 16 / 10.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF111111),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
                boxShadow: const <BoxShadow>[
                  BoxShadow(color: Color(0x33000000), blurRadius: 40, offset: Offset(0, 22)),
                ],
                border: Border.all(color: const Color(0xFF1F1F1F), width: 3),
              ),
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(widget.imageAsset, fit: BoxFit.cover),
              ),
            ),
          ),
          Container(
            height: 14,
            decoration: const BoxDecoration(
              color: Color(0xFF2A2A2A),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Container(
                width: 80,
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _terminalFrame() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0B0F12),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const <BoxShadow>[
            BoxShadow(color: Color(0x44000000), blurRadius: 40, offset: Offset(0, 22)),
          ],
          border: Border.all(color: const Color(0xFF1A2329), width: 1),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: <Widget>[
            Container(
              height: 32,
              color: const Color(0xFF161B20),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: <Widget>[
                  _dot(const Color(0xFFFF5F57)),
                  const SizedBox(width: 8),
                  _dot(const Color(0xFFFFBD2E)),
                  const SizedBox(width: 8),
                  _dot(const Color(0xFF28C840)),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                widget.imageAsset,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dot(Color color) => Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );

  Widget _unrealFrame() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          boxShadow: <BoxShadow>[
            BoxShadow(color: Color(0x44000000), blurRadius: 36, offset: Offset(0, 18)),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(child: Image.asset(widget.imageAsset, fit: BoxFit.cover)),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(height: 18, color: Colors.black),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(height: 18, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fullBleed() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const <BoxShadow>[
            BoxShadow(color: Color(0x33000000), blurRadius: 32, offset: Offset(0, 18)),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.asset(widget.imageAsset, fit: BoxFit.cover),
      ),
    );
  }
}

// Silence unused-field warning while we keep the size cache around for
// future scroll-driven tilt work.
// ignore_for_file: unused_field
