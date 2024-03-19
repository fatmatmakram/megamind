// ignore_for_file: use_build_context_synchronously

part of 'splash_imports.dart';

class SplashData {
  Timer? _timer;

  void loadSplash(BuildContext context) {
    _timer = Timer(
      const Duration(seconds: ConstantsManager.splashTime),
      () => manipulateSplashData(context),
    );
  }

  Future<void> manipulateSplashData(BuildContext context) async {
    Go.offAll(const Movies( ));
  }

  void dispose() {
    _timer?.cancel();
  }
}
