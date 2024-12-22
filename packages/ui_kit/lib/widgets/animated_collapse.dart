import 'package:flutter/material.dart';

/// Widget that allows hide [child] with animation if [show] is false
class AnimatedCollapse extends StatelessWidget {
  const AnimatedCollapse({
    required this.child,
    required this.show,
    super.key,
  });

  final Widget child;
  final bool show;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: kThemeAnimationDuration,
      crossFadeState: show ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: child,
      secondChild: const SizedBox.shrink(),
    );
  }
}
