import 'package:flutter/widgets.dart';

extension ColorX on Color {
  /// Color for background of event seeded from this
  Color get eventBackgroundColor {
    return withOpacity(0.2);
  }

  /// Color for appbar seeded from this
  Color get evenAppBarColor {
    return withOpacity(0.5);
  }

  /// Border for this color in [EventColorWidget]
  Border get eventBorder {
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness - 0.1).clamp(0.0, 1.0));

    return Border.all(color: hslLight.toColor());
  }

  /// Gradient seeded from this color for [EventColorWidget]
  Gradient get eventGradient {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0, 0.3, 0.6, 1],
      colors: [
        withOpacity(0.4),
        withOpacity(0.6),
        withOpacity(0.8),
        this,
      ],
    );
  }
}

/// Simple widget that displays color for event
class EventColorWidget extends StatelessWidget {
  const EventColorWidget.small({
    required this.color,
    super.key,
  }) : size = 10;

  const EventColorWidget.medium({
    required this.color,
    super.key,
  }) : size = 16;

  const EventColorWidget.big({
    required this.color,
    super.key,
  }) : size = 20;

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: color.eventGradient,
        border: color.eventBorder,
      ),
    );
  }
}
