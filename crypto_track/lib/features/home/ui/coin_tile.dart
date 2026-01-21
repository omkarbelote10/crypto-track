import 'package:crypto_track/features/currency/bloc/currency_bloc.dart';
import 'package:crypto_track/features/home/models/coin_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../currency/models/currency_type.dart';

class CoinTile extends StatelessWidget {
  final CoinDataModel coinDetails;

  const CoinTile({super.key, required this.coinDetails});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Image.network(coinDetails.image)),
      title: Text(coinDetails.symbol.toUpperCase()),
      trailing: BlocBuilder<CurrencyBloc, CurrencyState>(
        builder: (context, state) {
          final symbol = state.currency == Currency.usd ? '\$': '₹';
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$symbol ${coinDetails.currentPrice.toStringAsFixed(2)}'),
              const SizedBox(width: 30,),
              Text('${(coinDetails.marketCap / 1e9).toStringAsFixed(2)} B'),
              const SizedBox(width: 30,),
              Text('${coinDetails.priceChangePercentage.toStringAsFixed(2)} %'),
            ],
          );
        },
      ),
    );
  }
}
