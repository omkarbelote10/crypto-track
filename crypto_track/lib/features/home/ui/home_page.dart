import 'package:crypto_track/core/connectivity/ui/connectivity_banner.dart';
import 'package:crypto_track/features/coin_search/header_bloc/header_bloc.dart';
import 'package:crypto_track/features/currency/bloc/currency_bloc.dart';
import 'package:crypto_track/features/currency/models/currency_type.dart';
import 'package:crypto_track/features/home/bloc/home_bloc.dart';
import 'package:crypto_track/features/home/bloc/home_state.dart';
import 'package:crypto_track/features/home/ui/coin_list_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'coin_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_onScroll);
    context.read<HomeBloc>().add(HomeInitialEvent(currency: Currency.usd));
    super.initState();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<HomeBloc>().add(HomeFetchMoreEvent());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Track'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context,'/search',);
                context.read<HeaderBloc>().add(HeaderEmptyEvent());
              },
              icon: Icon(Icons.search)
          ),
          IconButton(
            onPressed: () {
              context.read<CurrencyBloc>().add(CurrencyChangeEvent());
            },
            icon: Icon(Icons.currency_exchange),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<HomeBloc>().add(HomeRefreshEvent());
        },
        child: Column(
          children: [
            const ConnectivityBanner(),
            const CoinListHeader(),
            const Divider(thickness: 2, color: Colors.black38),
            BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox(),
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  loaded: (coinsList, page, isLoadingMore, isReachedEnd) {
                    return Expanded(
                      child: ListView.separated(
                        controller: _scrollController,
                        itemBuilder: (context, index) {
                          if (index == coinsList.length) {
                            return const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/coin',
                                arguments: coinsList[index].id,
                              );
                            },
                            child: CoinTile(coinDetails: coinsList[index]),
                          );
                        },
                        separatorBuilder: (context, index) =>
                           const Divider(thickness: 2, height: 2),
                        itemCount: coinsList.length + (isLoadingMore ? 1 : 0),
                      ),
                    );
                  },
                  error: (message) {
                    return Expanded(
                      child: ListView(
                        physics: AlwaysScrollableScrollPhysics(),
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: const Center(
                              child: Text(
                                'Something went wrong please refresh',
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
