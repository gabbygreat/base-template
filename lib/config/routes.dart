import '../utils/utils.dart';

class FadeTransitionPage extends CustomTransitionPage {
  const FadeTransitionPage({
    required super.child,
    required super.key,
  }) : super(transitionsBuilder: _transitionsBuilder);

  static Widget _transitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
}

class SlideTransitionPage extends CustomTransitionPage {
  const SlideTransitionPage({
    required super.child,
    required super.key,
  }) : super(transitionsBuilder: _transitionsBuilder);

  static Widget _transitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutCirc,
          ),
        ),
        child: child,
      );
}

class SlideFadeTransitionPage extends CustomTransitionPage {
  const SlideFadeTransitionPage({
    required super.child,
    required super.key,
  }) : super(transitionsBuilder: _transitionsBuilder);

  static Widget _transitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // Create the slide animation
    Animation<Offset> slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
    ));

    // Create the fade animation
    Animation<double> fadeAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeIn,
    );

    // Combine them using a FadeTransition wrapped around a SlideTransition
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: slideAnimation,
        child: child,
      ),
    );
  }
}

final GoRouter routes = GoRouter(
  initialLocation: SampleScreen.path,
  // initialLocation: OnboardingScreen.path,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: SampleScreen.path,
      name: SampleScreen.name,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          child: const SampleScreen(),
          key: state.pageKey,
        );
      },
    ),
  ],
);
