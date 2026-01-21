import 'package:crypto_track/features/coin/models/current_price.dart';
import 'package:json_annotation/json_annotation.dart';
part 'market_cap_data_model.g.dart';

@JsonSerializable()
class MarketCapDataModel {
  @JsonKey(name: 'current_price', defaultValue: null)
  final CurrentPrice currentPrice;
  @JsonKey(name: 'market_cap_rank', defaultValue: null)
  final int? marketCapRank;
  @JsonKey(name: 'price_change_percentage_24h', defaultValue: null)
  final double? priceChangePercentage24H;
  @JsonKey(name: 'price_change_percentage_7d', defaultValue: null)
  final double? priceChangePercentage7D;
  @JsonKey(name: 'price_change_percentage_14d', defaultValue: null)
  final double? priceChangePercentage14D;
  @JsonKey(name: 'price_change_percentage_30d', defaultValue: null)
  final double? priceChangePercentage30D;
  @JsonKey(name: 'price_change_percentage_60d', defaultValue: null)
  final double? priceChangePercentage60D;
  @JsonKey(name: 'price_change_percentage_1y', defaultValue: null)
  final double? priceChangePercentage1Y;
  @JsonKey(name: 'total_supply', defaultValue: null)
  final double? totalSupply;
  @JsonKey(name: 'max_supply', defaultValue: null)
  final double? maxSupply;
  @JsonKey(name: 'last_updated', defaultValue: null)
  final String? lastUpdated;

  MarketCapDataModel({
    required this.marketCapRank,
    required this.priceChangePercentage24H,
    required this.priceChangePercentage7D,
    required this.priceChangePercentage14D,
    required this.priceChangePercentage30D,
    required this.priceChangePercentage60D,
    required this.priceChangePercentage1Y,
    required this.currentPrice,
    required this.totalSupply,
    required this.maxSupply,
    required this.lastUpdated,
  });

  factory MarketCapDataModel.fromJson(Map<String,dynamic> json) => _$MarketCapDataModelFromJson(json);
}
