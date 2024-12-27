import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CoreModule {
  @singleton
  @preResolve
  Future<SharedWrapper> get sharedWrapper => SharedWrapper().init();
}
