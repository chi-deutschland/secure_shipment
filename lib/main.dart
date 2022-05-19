import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secure_shipment/providers/app_provider.dart';
import 'package:secure_shipment/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';
import 'package:secure_shipment/screens/status_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///Set color status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ));

    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AppProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),

          //for flare animationq
          home: SplashScreen.navigate(
            name: 'assets/loading.riv',
            next: (context) => const LoginScreen(),
            until: () => Future.delayed(Duration(seconds: 3)),
            //isLoading: true,
            startAnimation: 'Animation 1',
            // endAnimation: '1',
          ),

          // Start the app with the "/" named route. In this case, the app starts
          // on the FirstScreen widget.
          // initialRoute: '/',
          routes: {
            // When navigating to the "/" route, build the LoginScreen widget.
            // '/': (context) => LoginScreen(),
            '/login': (context) => LoginScreen(),
            '/status': (context) => StatusScreen(),
            // '/ocr': (context) => Ocr(),
            // '/loading': (context) => LoadingScreen(nName: '', pPin: ''),
            // '/chi_cargo_validation': (context) => ChiCargoValidation(
            //       imageTempPath: '',
            //       uploadStatus: null,
            //     ),
            // '/enter_master': (context) => EnterMaster(
            //       imageTempPath: '',
            //    ),
          }),
    );
  }
}
