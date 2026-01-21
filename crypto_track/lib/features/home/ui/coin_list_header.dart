import 'package:flutter/material.dart';

class CoinListHeader extends StatelessWidget {
  const CoinListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Coins'),
          SizedBox(width: 132,),
          Text('Price'),
          SizedBox(width: 25,),
          Text('MarketCap'),
          SizedBox(width: 40,),
          Text('24H'),
          SizedBox(width: 30,),
        ],
      ),
    );
  }
}
