import 'package:crypto_track/features/coin/bloc/coin_bloc.dart';
import 'package:crypto_track/features/coin/bloc/coin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: BoxBorder.all(color: Colors.black12, width: 2)
      ),
      child: BlocBuilder<CoinBloc,CoinDetailsState>(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                Text('Total Supply: ${data.merketCapData.totalSupply.toString()}'),
                const SizedBox(height: 30,),
                Text('Max Supply: ${data.merketCapData.maxSupply.toString()}'),
                const SizedBox(height: 30,),
                Text('Last Updated: ${data.merketCapData.lastUpdated.toString()}'),
              ],
            );
          }
        },
      ),
    );
  }
}
