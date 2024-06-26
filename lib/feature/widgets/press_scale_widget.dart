import 'package:flutter/material.dart';

/// Coefficient of scaling in percent
const _defaultScaleRatio = 5.0;

/// {@template press_scale_widget}
/// Widget that resizes during press
/// {@endtemplate}
class PressScaleWidget extends StatefulWidget {
  /// {@macro press_scale_widget}
  const PressScaleWidget({
    required this.child,
    super.key,
    this.onPressed,
    this.radius,
    this.animationDuration = const Duration(milliseconds: 50),
    this.onLongPress,
    this.height,
    this.width,
    this.scaleRatio = _defaultScaleRatio,
  });

  /// Height of widget
  final double? height;

  /// Width of widget
  final double? width;

  /// Widget that displays inside of press
  final Widget? child;

  /// Press callback
  final VoidCallback? onPressed;

  /// Long press callback
  final VoidCallback? onLongPress;

  /// Radius of hover effect
  final double? radius;

  /// Duration of scale animation, default to 50 milliseconds
  final Duration animationDuration;

  /// Scale ratio in percent, default [_defaultScaleRatio]
  final double scaleRatio;

  @override
  PressScaleWidgetState createState() => PressScaleWidgetState();
}

class PressScaleWidgetState extends State<PressScaleWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _doubleAnimation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    )..addListener(() {
        // ignore: no-empty-block
        setState(() {});
      });
    _doubleAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    assert(
      debugCheckHasMaterial(context),
      'No Material above PressScaleWidget',
    );

    return InkResponse(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onHighlightChanged: _onHighlightChanged,
      onLongPress: widget.onLongPress,
      onTap: widget.onPressed,
      radius: widget.radius,
      child: Transform.scale(
        // ignore: no-magic-number
        scale: 1.0 - (_doubleAnimation.value * widget.scaleRatio / 100),
        child: SizedBox(
          height: widget.height,
          width: widget.width,
          child: widget.child,
        ),
      ),
    );
  }

  void _onHighlightChanged(bool isPressed) {
    if (isPressed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }
}
