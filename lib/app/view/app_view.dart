import 'package:easy_localization/easy_localization.dart';
import 'package:events_tracker/app/router/router.dart';
import 'package:events_tracker/app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = getRouter(context);
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // theme: everPredefinedLightTheme(),
      // darkTheme: everPredefinedDarkTheme(),
      builder: (context, child) => AppRootWidgets(child: child ?? Container()),
    );
  }
}
