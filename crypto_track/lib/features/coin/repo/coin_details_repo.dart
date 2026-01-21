import 'dart:convert';

import 'package:crypto_track/data/services/coingecko_api_services.dart';
import 'package:crypto_track/features/coin/models/coin_details_model.dart';

class CoinDetailsRepo {
  static Future<CoinDetailsModel> getCoinDetails({required String coinId}) async {
    final response = await CoingeckoApiServices.fetchCoinDetails(coinId: coinId);
    if(response.statusCode == 200){
      final data = jsonDecode(response.body) as Map<String,dynamic> ;
      return CoinDetailsModel.fromJson(data);
    }else{
      throw Exception(response.statusCode);
    }
}
}