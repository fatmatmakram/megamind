part of 'splash_imports.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    SplashData().loadSplash(context);
  }

  @override
  void dispose() {
    SplashData().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Image.asset(
          AssetsManager.logo,
          height: MediaQuery.of(context).size.height * .3,
          width: MediaQuery.of(context).size.width * .7,
        ),
      ),
    );
  }
}
