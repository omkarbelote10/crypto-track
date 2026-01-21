import 'dart:convert';

import 'package:crypto_track/data/services/coingecko_api_services.dart';
import 'package:crypto_track/features/coin_search/models/search_coin_data_model.dart';

class TrendingRepo {
  static Future<List<SearchCoinDataModel>> getTrndingCoins() async {
    final response = await CoingeckoApiServices.fetchTrendingCoins();
    if(response.statusCode == 200){
      final data = jsonDecode(response.body) as Map<String,dynamic>;
      final List<SearchCoinDataModel> coinsList = (data['coins'] as List<dynamic>).map((e){
        return SearchCoinDataModel.fromJson((e as Map<String,dynamic>)['item']);
      }
      ).toList();

      return coinsList;
    }else{
      throw Exception(response.statusCode);
    }
}
}