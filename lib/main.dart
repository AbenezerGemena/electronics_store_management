
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:store_management/firebase_options.dart';
import 'package:store_management/pages/add_products.dart';
import 'package:store_management/pages/delete_products.dart';
import 'package:store_management/pages/home_page.dart';
import 'package:store_management/pages/login_page.dart';
import 'package:store_management/pages/signin_page.dart';
import 'package:store_management/pages/update_products.dart';
import 'package:store_management/pages/view_product.dart';
import 'package:store_management/services/alert_service.dart';
import 'package:store_management/services/auth_service.dart';


class NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final Map<String, Widget Function(BuildContext)> _routes = {
    "/login": (context) => const LoginPage(),
    "/sign up": (context) => const SigninPage(),
    "/home": (context) => const HomePage(),
    "/add": (context) => const AddProducts(),
    "/view": (context) => const ViewProduct(),
    "/update": (context) => const UpdateProducts(),
    "delete" : (context) => const DeleteProducts()
  };

  GlobalKey<NavigatorState>? get navigatorKey {
    return _navigatorKey;
  }

  Map<String, Widget Function(BuildContext)>? get routes {
    return _routes;
  }

  void pushNamed(String routeName) {
    _navigatorKey.currentState?.pushNamed(routeName);
  }

 void pushReplacementNamed(String routeName){
  _navigatorKey.currentState?.popAndPushNamed(routeName);
 }

  void goBack() {
    _navigatorKey.currentState?.pop();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup(); 
  print(12);
 

  runApp(
    MyApp()
   
  );
}

Future<void> setup() async {
  await setupFirebase();
  await registerServices();
}

Future<void> setupFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> registerServices() async {
  final GetIt getIt = GetIt.instance;
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<NavigationService>(NavigationService());
  getIt.registerSingleton<AlertServices>(AlertServices());
}

class MyApp extends StatelessWidget {
  final GetIt _getIt = GetIt.instance;
  late final NavigationService _navigationService;
  late final AuthService _authService;

  MyApp({super.key}) {
    // Check that the services are registered
    assert(_getIt.isRegistered<NavigationService>(), 'NavigationService not registered!');
    assert(_getIt.isRegistered<AuthService>(), 'AuthService not registered!');
    
    _navigationService = _getIt<NavigationService>();
    _authService = _getIt<AuthService>();
  }

  @override
  Widget build(BuildContext context) {
    String initialRoute = _authService.user != null ? "/home" : "/login";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigationService.navigatorKey,
      initialRoute: initialRoute,
      routes: _navigationService.routes!,
    );
  }
}
