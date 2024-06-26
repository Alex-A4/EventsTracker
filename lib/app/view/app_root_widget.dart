import 'package:events_tracker/app/services/localization/localization.dart';
import 'package:flutter/widgets.dart';

/// Widget that should be placed at the root of the app
/// This is a good place to put services that should be available
/// throughout the app
class AppRootWidgets extends StatelessWidget {
  const AppRootWidgets({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LocalizationServiceWidget(
      child: child,
    );
  }
}
