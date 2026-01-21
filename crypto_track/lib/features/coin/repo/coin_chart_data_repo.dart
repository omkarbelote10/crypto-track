import 'dart:convert';

import 'package:crypto_track/features/currency/models/currency_type.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../data/services/coingecko_api_services.dart';

class CoinChartDataRepo {
  static Future<List<FlSpot>> getFlSpots({required final String coinId, required Currency currency}) async {
    final String currencyAsString = (currency == Currency.usd) ? 'usd':'inr';
    final response = await CoingeckoApiServices.fetchCoinMarketChart(coinId: coinId,currency: currencyAsString);
    if(response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> rawPrices = data['prices'] as List;
      List<FlSpot> listOfFlSpots = rawPrices.asMap().entries.map((entry){
        final index = entry.key.toDouble();
        final price = entry.value[1];
        return FlSpot(index, price as double);
      }).toList();
      return listOfFlSpots;
    } else {
      throw Exception(response.statusCode);
    }

  }
}