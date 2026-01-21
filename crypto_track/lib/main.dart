import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crypto_track/app/app_router.dart';
import 'package:crypto_track/core/connectivity/bloc/connectivity_bloc.dart';
import 'package:crypto_track/features/coin/bloc/coin_bloc.dart';
import 'package:crypto_track/features/coin_search/bloc/search_bloc.dart';
import 'package:crypto_track/features/coin_search/header_bloc/header_bloc.dart';
import 'package:crypto_track/features/currency/bloc/currency_bloc.dart';
import 'package:crypto_track/features/home/bloc/home_bloc.dart';
import 'package:crypto_track/features/home/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityBloc>(
          create: (context) => ConnectivityBloc(Connectivity()),
        ),
        BlocProvider<CurrencyBloc>(create: (context) => CurrencyBloc()),
        BlocProvider<CoinBloc>(
          create: (context) => CoinBloc(connectivityBloc: context.read<ConnectivityBloc>(),currencyBloc: context.read<CurrencyBloc>()),
        ),
        BlocProvider(create: (context) => SearchBloc(connectivityBloc: context.read<ConnectivityBloc>())),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
            currencyBloc: context.read<CurrencyBloc>(),
            connectivityBloc: context.read<ConnectivityBloc>(),
          ),
        ),
        BlocProvider(create: (context) => HeaderBloc(),)
      ],
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: AppRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.blueAccent,
            selectionColor: Colors.blueAccent.withValues(alpha: 0.5),
            selectionHandleColor: Colors.blueAccent,
          ),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey.shade700,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
            foregroundColor: Colors.white,
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
