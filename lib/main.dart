import 'utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.instance.initialise();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Skite Chat',
          routerConfig: routes,
          theme: ThemeData(
            useMaterial3: false,
            appBarTheme: AppBarTheme(
              elevation: 0,
              color: AppColor.instance.secondary,
            ),
            fontFamily: AppConstant.fontFamily,
          ),
        );
      },
    );
  }
}
