import 'package:crypto_track/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;


class CoingeckoApiServices {
  static const _baseUrl = 'api.coingecko.com';
  static final _header = {
    'x-cg-demo-api-key' : apiKey,
  };

  static Future<http.Response> fetchCoinsMarketData({required int page , required String currency}) async {
    final path = '/api/v3/coins/markets';
    final Map<String, String> queryParameters = {
      'vs_currency': currency,
      'order': 'market_cap_desc',
      'per_page' : '15',
      'page' : '$page'
    };
    final uri = Uri.https(_baseUrl, path, queryParameters);
    final response = await http.get(uri,headers: _header);
    return response;
  }

  static Future<http.Response> fetchCoinMarketChart({required String coinId, required String currency}) async {
    final path = '/api/v3/coins/$coinId/market_chart';
    final Map<String, String> queryParameters = {
      'vs_currency' : currency,
      'days' : '7',
    };
    final uri = Uri.https(_baseUrl,path,queryParameters);
    final response = await http.get(uri,headers: _header);
    return response;
  }

  static Future<http.Response> fetchQueryCoins({required String query}){
    const String path = '/api/v3/search';
    final Map<String,String> queryParameters = {
      'query' : query,
    };
    final uri = Uri.http(_baseUrl,path,queryParameters);
    final response = http.get(uri,headers: _header);
    return response;
  }
  static Future<http.Response> fetchTrendingCoins() async {
    const String path = '/api/v3/search/trending';
    final uri = Uri.http(_baseUrl,path);
    final response = await http.get(uri,headers: _header);
    return response;
  }

  static Future<http.Response> fetchCoinDetails({required String coinId}) async {
    final path = '/api/v3/coins/$coinId';
    final uri = Uri.http(_baseUrl,path,);
    final response = await http.get(uri,headers: _header);
    return response;
}
}
