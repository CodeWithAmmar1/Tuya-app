import 'package:app/screens/Login_Screen.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/lock_screen.dart';
import 'package:app/screens/profile_screen.dart';
import 'package:app/screens/search_screen.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:app/widgets/screen_with_nav.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // Navigation bar index mapping
  static const Map<String, int> navIndexMap = {
    '/home': 0,
    '/search': 1,
    '/access_log': 2,
    '/profile': 3,
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // Helper to build a screen with bottom navigation bar
    Widget buildScreenWithNav(int index, Widget child) {
      return ScreenWithNav(
        currentIndex: index,
        onNavTap: (int newIndex) {
          String newRoute = navIndexMap.keys.elementAt(newIndex);
          if (newRoute != settings.name) {
            navigatorKey.currentState?.pushReplacementNamed(newRoute);
          }
        },
        child: child,
      );
    }

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      case '/home':
        return MaterialPageRoute(
          builder: (_) =>
              buildScreenWithNav(navIndexMap['/home'] ?? 0, HomeScreen()),
        );

      case '/search':
        return MaterialPageRoute(
          builder: (_) =>
              buildScreenWithNav(navIndexMap['/search'] ?? 0, SearchScreen()),
        );

      case '/access_log':
        return MaterialPageRoute(
          builder: (_) => buildScreenWithNav(
              navIndexMap['/access_log'] ?? 0, const LoginScreen()),
        );

      case '/profile':
        return MaterialPageRoute(
          builder: (_) => buildScreenWithNav(
              navIndexMap['/profile'] ?? 0, const ProfileScreen()),
        );

      case '/lock':
        return MaterialPageRoute(builder: (_) => const LockScreen());

      default:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
    }
  }
}
