import 'dart:convert';

import 'package:crypto_track/features/home/models/coin_data_model.dart';
import '../../../data/services/coingecko_api_services.dart';
import '../../currency/models/currency_type.dart';
class CoinsRepo {
  static Future<List<CoinDataModel>> getCoinsList({required int page, required Currency currency}) async {
    String currencyAsString = currency == Currency.usd ? 'usd' : 'inr';
    final response = await CoingeckoApiServices.fetchCoinsMarketData(page: page,currency: currencyAsString);
    if(response.statusCode == 200){
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((e) => CoinDataModel.fromJson(e)).toList();
    }else{
      throw Exception(response.statusCode);
    }
  }

}