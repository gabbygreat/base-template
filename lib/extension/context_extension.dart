import '../utils/utils.dart';

extension ContextExtension on BuildContext {
  Future<T?> pushTo<T extends Object?>(Widget child) {
    return Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) => child,
      ),
    );
  }

  Future<T?> goTo<T extends Object?>(Widget child) {
    return Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => child),
      (route) => false,
    );
  }

  void popTo<T extends Object?>([T? result, bool routeNavigator = false]) {
    return Navigator.of(this, rootNavigator: routeNavigator).pop(result);
  }
}
