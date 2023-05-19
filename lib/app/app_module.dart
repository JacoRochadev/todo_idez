import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_module.dart';
import 'presentation/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const SplashPage(),
        ),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
