
abstract class BaseModule {
    void init();
}

class Modules {
  final List<BaseModule> modules;

  Modules(this.modules);

  void start() {
    modules.forEach((element) {
      element.init();
    });
  }
}

