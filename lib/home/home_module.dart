import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_idez/home/presentation/home_page.dart';

import 'application/home_store.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => HomeStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const HomePage(),
        ),
      ];
}
