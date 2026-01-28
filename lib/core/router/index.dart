import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'ipad/router.dart';
import 'mobile/router.dart';
import 'web/router.dart';

class Routes {
  Routes._internal();
  static final Routes _singleton = Routes._internal();
  static Routes get instance => _singleton;

  GoRouter? _router;

  GoRouter get router {
    _router ??= getRoutes();
    return _router!;
  }

  GoRouter getRoutes({
    List<NavigatorObserver>? observers,
    bool isMobile = true,
  }) {
    if (_router != null) return _router!;

    final routing = kIsWeb ? WebRouting() : MobileRouting.instance;

    _router = routing.getRoutes(observers: observers);
    return _router!;
  }
}
