// import 'package:company_task/featurs/home/presentation/home.dart';
// import 'package:company_task/featurs/splash/presentation/views/splash.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../../../featurs/auth/presentation/views/login.dart';
// import '../../../featurs/auth/presentation/views/phone_login.dart';
// import '../../../featurs/auth/presentation/views/register.dart';
// import '../app_routing_base.dart';

// class IPadRouting extends AppRoutingBase {
//   @override
//   GoRouter getRoutes({List<NavigatorObserver>? observers}) {
//     return GoRouter(
//       //initialLocation: initialLocation,
//       observers: observers,
//       debugLogDiagnostics: true,
//       initialLocation: SplashPage.routeName,

//       routes: [
//         GoRoute(
//           path: HomePage.routeName,
//           name: HomePage.routeName,
//           builder: (context, state) => const HomePage(),
//         ),
//         GoRoute(
//           path: SplashPage.routeName,
//           name: SplashPage.routeName,
//           builder: (context, state) => const SplashPage(),
//         ),
//         GoRoute(
//           path: LoginPage.routeName,
//           name: LoginPage.routeName,
//           builder: (context, state) => const LoginPage(),
//         ),
//         GoRoute(
//           path: RegisterPage.routeName,
//           name: RegisterPage.routeName,
//           builder: (context, state) => const RegisterPage(),
//         ),
//         GoRoute(
//           path: PhoneLogin.routeName,
//           name: PhoneLogin.routeName,
//           builder: (context, state) => const PhoneLogin(),
//         ),
//       ],
//     );
//   }
// }
