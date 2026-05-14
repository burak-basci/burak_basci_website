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
/// Applies a subtle 3D perspective tilt; flip [tiltLeft] for a mirrored shot.
class DeviceMockup extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final Widget frame;
    switch (type) {
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

    final double rotY = tiltLeft ? 0.06 : -0.06;
    final double rotX = 0.04;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.0009) // perspective
            ..rotateY(rotY)
            ..rotateX(rotX),
          child: frame,
        ),
      ),
    );
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
                child: Image.asset(imageAsset, fit: BoxFit.cover),
              ),
              // Notch
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
                child: Image.asset(imageAsset, fit: BoxFit.cover),
              ),
            ),
          ),
          // Hinge
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
            // Title bar with traffic lights
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
                imageAsset,
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
            Positioned.fill(child: Image.asset(imageAsset, fit: BoxFit.cover)),
            // Subtle letterbox bars top + bottom (5% each)
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
        child: Image.asset(imageAsset, fit: BoxFit.cover),
      ),
    );
  }
}
