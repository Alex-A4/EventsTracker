import 'package:events_tracker/feature/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@TypedGoRoute<SettingsRoute>(
  path: 'settings',
  routes: [],
)
class SettingsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const SettingsPage();
}
