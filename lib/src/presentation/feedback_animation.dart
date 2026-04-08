import 'dart:math' as math;

import 'package:flutter/material.dart';

/// A self-contained, fully-Flutter feedback animation.
///
/// Shows an animated chat bubble with staggered typing dots, a pulsing ring,
/// and orbiting sparkles — all drawn in [color] (falls back to
/// [ColorScheme.primary] when null).
class FeedbackAnimation extends StatefulWidget {
  const FeedbackAnimation({super.key, this.color, this.size = 180});

  /// Tint color for the whole animation. Defaults to [ColorScheme.primary].
  final Color? color;

  /// Overall bounding box size. Defaults to 180.
  final double size;

  @override
  State<FeedbackAnimation> createState() => _FeedbackAnimationState();
}

class _FeedbackAnimationState extends State<FeedbackAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  // Typing dots — staggered bounce intervals within [0, 1]
  late final Animation<double> _dot1;
  late final Animation<double> _dot2;
  late final Animation<double> _dot3;

  // Pulse ring — expands & fades over the full cycle
  late final Animation<double> _pulse;

  // Sparkle orbit — full rotation every cycle
  late final Animation<double> _orbit;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat();

    _dot1 = _bounceTween(0.00, 0.40);
    _dot2 = _bounceTween(0.15, 0.55);
    _dot3 = _bounceTween(0.30, 0.70);

    _pulse = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOut),
    );

    _orbit = Tween<double>(begin: 0, end: 2 * math.pi).animate(_ctrl);
  }

  Animation<double> _bounceTween(double start, double end) =>
      Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _ctrl,
          curve: Interval(start, end, curve: Curves.easeInOut),
        ),
      );

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Theme.of(context).colorScheme.primary;
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (_, __) => CustomPaint(
          painter: _FeedbackPainter(
            color: color,
            dot1: _dot1.value,
            dot2: _dot2.value,
            dot3: _dot3.value,
            pulse: _pulse.value,
            orbit: _orbit.value,
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------

class _FeedbackPainter extends CustomPainter {
  const _FeedbackPainter({
    required this.color,
    required this.dot1,
    required this.dot2,
    required this.dot3,
    required this.pulse,
    required this.orbit,
  });

  final Color color;
  final double dot1, dot2, dot3;
  final double pulse;
  final double orbit;

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width * 0.32;
    final center = Offset(cx, cy);

    // Pulse ring — expands and fades
    canvas.drawCircle(
      center,
      r * (1 + pulse * 0.55),
      Paint()
        ..color = color.withAlpha(((1 - pulse) * 0.35 * 255).round())
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5,
    );

    // Soft background circle
    canvas.drawCircle(
      center,
      r,
      Paint()..color = color.withAlpha((0.14 * 255).round()),
    );

    // Chat bubble + typing dots
    _drawBubble(canvas, center, r * 0.60, color);

    // Orbiting sparkles
    _drawSparkles(canvas, center, r * 1.3, color);
  }

  void _drawBubble(Canvas canvas, Offset center, double s, Color color) {
    final paint = Paint()..color = color;

    // Rounded rectangle body
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx, center.dy - s * 0.08),
          width: s * 2.0,
          height: s * 1.25,
        ),
        Radius.circular(s * 0.35),
      ),
      paint,
    );

    // Bubble tail
    canvas.drawPath(
      Path()
        ..moveTo(center.dx - s * 0.15, center.dy + s * 0.54)
        ..lineTo(center.dx - s * 0.55, center.dy + s * 0.95)
        ..lineTo(center.dx + s * 0.15, center.dy + s * 0.54)
        ..close(),
      paint,
    );

    // Typing dots (white, staggered bounce)
    final dotPaint = Paint()..color = Colors.white.withAlpha((0.92 * 255).round());
    final dotR = s * 0.115;
    final dotY = center.dy - s * 0.08;
    final bounce = s * 0.18;
    final spacing = s * 0.37;

    canvas.drawCircle(
        Offset(center.dx - spacing, dotY - bounce * _bell(dot1)), dotR, dotPaint);
    canvas.drawCircle(
        Offset(center.dx, dotY - bounce * _bell(dot2)), dotR, dotPaint);
    canvas.drawCircle(
        Offset(center.dx + spacing, dotY - bounce * _bell(dot3)), dotR, dotPaint);
  }

  /// Bell curve: peaks at t = 0.5
  double _bell(double t) => math.sin(t * math.pi);

  void _drawSparkles(Canvas canvas, Offset center, double orbitR, Color color) {
    const count = 5;
    for (var i = 0; i < count; i++) {
      final angle = orbit + (2 * math.pi * i / count);
      final pos = Offset(
        center.dx + math.cos(angle) * orbitR,
        center.dy + math.sin(angle) * orbitR,
      );
      if (i.isEven) {
        _drawStar(
          canvas,
          pos,
          orbitR * 0.085,
          Paint()..color = color.withAlpha((0.75 * 255).round()),
        );
      } else {
        canvas.drawCircle(
          pos,
          orbitR * 0.055,
          Paint()..color = color.withAlpha((0.50 * 255).round()),
        );
      }
    }
  }

  void _drawStar(Canvas canvas, Offset c, double r, Paint paint) {
    final path = Path();
    for (var i = 0; i < 8; i++) {
      final angle = i * math.pi / 4 - math.pi / 2;
      final radius = i.isEven ? r : r * 0.42;
      final pt = Offset(
        c.dx + math.cos(angle) * radius,
        c.dy + math.sin(angle) * radius,
      );
      i == 0 ? path.moveTo(pt.dx, pt.dy) : path.lineTo(pt.dx, pt.dy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_FeedbackPainter old) =>
      old.color != color ||
      old.dot1 != dot1 ||
      old.dot2 != dot2 ||
      old.dot3 != dot3 ||
      old.pulse != pulse ||
      old.orbit != orbit;
}

