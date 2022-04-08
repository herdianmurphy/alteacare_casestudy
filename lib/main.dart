import 'package:alteacare_casestudy/injection.dart' as di;
import 'package:alteacare_casestudy/observer.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );

  di.init();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: Observer(),
  );
}

const int _whitePrimaryValue = 0xFFFFFFFF;
const MaterialColor white = MaterialColor(
  _whitePrimaryValue,
  <int, Color>{500: Color(_whitePrimaryValue)},
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //AUTH
        BlocProvider(
          create: (_) => di.locator<DoctorBloc>(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('id', 'ID'),
        ],
        title: 'Doctor List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            primaryColor: Colors.white,
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            })),
        home: const MainPage(),
        navigatorObservers: [routeObserver],
      ),
    );
  }
}
