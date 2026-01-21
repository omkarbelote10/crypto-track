import 'package:crypto_track/features/coin/bloc/coin_bloc.dart';
import 'package:crypto_track/features/coin/bloc/coin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PercentageChangeWidget extends StatelessWidget {
  const PercentageChangeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: BoxBorder.all(color: Colors.black12, width: 2)
      ),
      child: BlocBuilder<CoinBloc, CoinDetailsState>(
        builder: (context, state) {
          if(state.isDetailsLoading){
            return const Center(child: CircularProgressIndicator());
          }
          else if(state.detailsError != null){
            return const Center(child: Text('Could not load the details'));
          }
          else{
            final data = state.coinDetail!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('24H'),
                    Text('7D'),
                    Text('14D'),
                    Text('30D'),
                    Text('60D'),
                    Text('1Y'),
                  ],
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('\u25b2 ${data.merketCapData.priceChangePercentage24H?.toStringAsFixed(2)}'),
                    Text('\u25b2 ${data.merketCapData.priceChangePercentage7D?.toStringAsFixed(2)}'),
                    Text('\u25b2 ${data.merketCapData.priceChangePercentage14D?.toStringAsFixed(2)}'),
                    Text('\u25b2 ${data.merketCapData.priceChangePercentage30D?.toStringAsFixed(2)}'),
                    Text('\u25b2 ${data.merketCapData.priceChangePercentage60D?.toStringAsFixed(2)}'),
                    Text('\u25b2 ${data.merketCapData.priceChangePercentage1Y?.toStringAsFixed(2)}'),
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
