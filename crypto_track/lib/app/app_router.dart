import 'package:crypto_track/features/coin/ui/coin_page.dart';
import 'package:crypto_track/features/coin_search/ui/search_page.dart';
import 'package:crypto_track/features/home/ui/home_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/search':
        return MaterialPageRoute(builder: (context) => const SearchPage());
      case '/coin':
        final coinId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => CoinPage(coinId: coinId),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Route Not Found'))),
        );
    }
  }
}
