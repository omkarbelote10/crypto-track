import 'package:crypto_track/features/coin_search/header_bloc/header_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinListHeader extends StatelessWidget {
  const CoinListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeaderBloc, HeaderState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case HeaderInitial:
            return const SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Trending Coins'),
                  SizedBox(width: 250,),
                  Text('Rank'),
                  SizedBox(width: 20,),
                ],
              ),
            );
          case HeaderTrendingState:
            return const SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Trending Coins'),
                  SizedBox(width: 250,),
                  Text('Rank'),
                  SizedBox(width: 20,),
                ],
              ),
            );
          case HeaderSearchedState:
            return const SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Search Results'),
                  SizedBox(width: 250,),
                  Text('Rank'),
                  SizedBox(width: 20,),
                ],
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
