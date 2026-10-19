import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme.dart';

/// 종합 점수 링
class ScoreRing extends StatelessWidget {
  final double score;
  final double size;
  final double strokeWidth;
  const ScoreRing({
    super.key,
    required this.score,
    this.size = 120,
    this.strokeWidth = 12,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _RingPainter(score, strokeWidth),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                score.toStringAsFixed(0),
                style: TextStyle(
                  fontSize: size * 0.30,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.ink,
                ),
              ),
              Text(
                AppTheme.scoreWord(score),
                style: TextStyle(
                  fontSize: size * 0.13,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.scoreColor(score),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double score;
  final double strokeWidth;
  _RingPainter(this.score, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final bg = Paint()
      ..color = AppTheme.line
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, bg);

    final color = AppTheme.scoreColor(score);
    final fg = Paint()
      ..shader = LinearGradient(
        colors: [color.withValues(alpha: 0.65), color],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * (score / 100),
      false,
      fg,
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter old) =>
      old.score != score;
}

/// 차원별 점수 바
class DimensionBar extends StatelessWidget {
  final String title;
  final double score;
  final String grade;
  const DimensionBar({
    super.key,
    required this.title,
    required this.score,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.scoreColor(score);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 74,
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600)),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: score / 100,
                    minHeight: 9,
                    backgroundColor: AppTheme.line,
                    valueColor: AlwaysStoppedAnimation(color),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 76,
                child: Text(
                  '${score.toStringAsFixed(0)} · $grade',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: color),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 섹션 카드
class SectionCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget child;
  final IconData? icon;
  const SectionCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.child,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 20, color: AppTheme.primary),
                  const SizedBox(width: 8),
                ],
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700)),
              ],
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(subtitle!,
                  style:
                      const TextStyle(fontSize: 12, color: AppTheme.sub)),
            ],
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

/// 등급 뱃지
class GradeChip extends StatelessWidget {
  final String label;
  final Color color;
  const GradeChip(this.label, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Text(label,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, color: color)),
    );
  }
}

/// 오행 색상
Color elementColor(String e) {
  switch (e) {
    case '목':
      return const Color(0xFF43A06B);
    case '화':
      return const Color(0xFFE05D5D);
    case '토':
      return const Color(0xFFC98A1B);
    case '금':
      return const Color(0xFF8A93A6);
    case '수':
      return const Color(0xFF4A7FB5);
    default:
      return AppTheme.sub;
  }
}

/// 오행 칩
class ElementChip extends StatelessWidget {
  final String element;
  const ElementChip(this.element, {super.key});

  @override
  Widget build(BuildContext context) {
    final c = elementColor(element);
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.14),
        shape: BoxShape.circle,
        border: Border.all(color: c.withValues(alpha: 0.4)),
      ),
      child: Text(element,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w800, color: c)),
    );
  }
}
