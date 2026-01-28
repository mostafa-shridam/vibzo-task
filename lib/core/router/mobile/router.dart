import 'package:company_task/featurs/auth/presentation/views/create_password.dart';
import 'package:company_task/featurs/auth/presentation/views/login_with_phone.dart';
import 'package:company_task/featurs/personalisation/presentation/personalisation%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../featurs/auth/domain/repositories/auth_repository_impl.dart';
import '../../../featurs/auth/presentation/bloc/auth_bloc.dart';
import '../../../featurs/auth/presentation/views/auth_page.dart';
import '../../../featurs/auth/presentation/views/otp_page.dart';
import '../../../featurs/auth/presentation/views/conntinue_with_phone.dart';
import '../../../featurs/home/presentation/home.dart';
import '../../../featurs/splash/presentation/views/splash.dart';
import '../app_routing_base.dart';

class MobileRouting extends AppRoutingBase {
  // 1. Singleton Setup
  static final MobileRouting _singleton = MobileRouting._internal();
  MobileRouting._internal() {
    _router = _buildRouter();
  }
  static MobileRouting get instance => _singleton;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter _router;

  GoRouter get router => _router;

  @override
  GoRouter getRoutes({List<NavigatorObserver>? observers}) {
    return _router;
  }

  GoRouter _buildRouter() {
    return GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      initialLocation: SplashPage.routeName,
      redirect: (context, state) {
        return null;
      },
      routes: [
        GoRoute(
          path: HomePage.routeName,
          name: HomePage.routeName,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: SplashPage.routeName,
          name: SplashPage.routeName,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: LoginPage.routeName,
          name: LoginPage.routeName,
          builder: (context, state) => BlocProvider(
            create: (context) => AuthBloc(authRepository: AuthRepositoryImpl()),
            child: const LoginPage(),
          ),
        ),

        GoRoute(
          path: PhoneLogin.routeName,
          name: PhoneLogin.routeName,
          builder: (context, state) => BlocProvider(
            create: (context) => AuthBloc(authRepository: AuthRepositoryImpl()),
            child: const PhoneLogin(),
          ),
        ),
        GoRoute(
          path: OtpPage.routeName,
          name: OtpPage.routeName,
          builder: (context, state) => BlocProvider(
            create: (context) => AuthBloc(authRepository: AuthRepositoryImpl()),
            child: OtpPage(phone: state.extra as String),
          ),
        ),

        GoRoute(
          path: CreatePasswordPage.routeName,
          name: CreatePasswordPage.routeName,
          builder: (context, state) => CreatePasswordPage(),
        ),

        GoRoute(
          path: LoginWithPhone.routeName,
          name: LoginWithPhone.routeName,
          builder: (context, state) => LoginWithPhone(),
        ),
        GoRoute(
          path: PersonalisationPage.routeName,
          name: PersonalisationPage.routeName,
          builder: (context, state) => PersonalisationPage(),
        ),
      ],
    );
  }
}
