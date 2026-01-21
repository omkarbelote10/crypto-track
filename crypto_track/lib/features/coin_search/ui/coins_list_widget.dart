import 'package:crypto_track/features/coin_search/models/search_coin_data_model.dart';
import 'package:flutter/material.dart';

class CoinsListWidget extends StatelessWidget {
  final List<SearchCoinDataModel> coinsList;
  const CoinsListWidget({super.key, required this.coinsList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/coin',arguments: coinsList[index].id);
          },
          child: ListTile(
            leading: SizedBox(
              width: 40,
              height: 40,
              child: ClipOval(
                child: Image.network(coinsList[index].imageThumb,fit: BoxFit.fill,),),
            ),
            title: Text(coinsList[index].symbol),
            subtitle: Text(coinsList[index].name),
            trailing: Text('# ${coinsList[index].marketCapRank.toString()}',textAlign: TextAlign.start,),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(thickness: 2,height:0,),
      itemCount: coinsList.length,
    );
  }
}
