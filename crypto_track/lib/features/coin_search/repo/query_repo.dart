import 'dart:convert';

import 'package:crypto_track/features/coin_search/models/search_coin_data_model.dart';
import '../../../data/services/coingecko_api_services.dart';

class QueryRepo {
  static Future<List<SearchCoinDataModel>>getQueryCoins({required String query}) async {
    final response = await CoingeckoApiServices.fetchQueryCoins(query: query);
    if(response.statusCode == 200){
      final data = jsonDecode(response.body) as Map<String,dynamic>;
      final List<SearchCoinDataModel> coinsList = (data['coins'] as List<dynamic>).map((e){
        return SearchCoinDataModel.fromJson(e);
      }).toList();
      return coinsList;
    }else{
      throw Exception(response.statusCode);
    }
}
}