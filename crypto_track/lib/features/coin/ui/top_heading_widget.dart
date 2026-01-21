import 'package:crypto_track/features/coin/bloc/coin_bloc.dart';
import 'package:crypto_track/features/coin/bloc/coin_state.dart';
import 'package:crypto_track/features/currency/bloc/currency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../currency/models/currency_type.dart';

class TopHeadingWidget extends StatelessWidget {
  const TopHeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: BlocBuilder<CoinBloc, CoinDetailsState>(
        builder: (context, state) {
          if (state.isDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state.detailsError != null) {
            return const Center(child: Text('Could not load the details'));
          }
          else {
            final data = state.coinDetail!;
            return Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(data.name.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(color: Colors.black, fontSize: 25),),
                    ),
                    Text(' #${data.merketCapData.marketCapRank}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<CurrencyBloc, CurrencyState>(
                      builder: (context, state) {
                        if(state.currency == Currency.usd){
                          return Text('\$ ${data.merketCapData.currentPrice.usd.toString()}');
                        }else{
                          return Text('₹ ${data.merketCapData.currentPrice.inr.toString()}');
                        }
                      },
                    ),
                    Text(' \u25b2 ${data.merketCapData
                        .priceChangePercentage24H}'),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
