import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'package:tcddbiletfinding/core/di/di.config.dart';

/// Global tanımlanan [Service Locator] instance'ı
 GetIt getIt = GetIt.instance;


///
@InjectableInit()


GetIt configureDependencies() => getIt.init();
