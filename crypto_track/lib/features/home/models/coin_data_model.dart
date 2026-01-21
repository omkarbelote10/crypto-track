import 'package:json_annotation/json_annotation.dart';
part 'coin_data_model.g.dart';
@JsonSerializable()
class CoinDataModel {
  final String id;
  @JsonKey(defaultValue: 'null')
  final String symbol;
  @JsonKey(defaultValue: 'null')
  final String image;
  @JsonKey(name: 'current_price',defaultValue: 0.0)
  final double currentPrice;
  @JsonKey(name: 'market_cap',defaultValue: 0)
  final int marketCap;
  @JsonKey(name: 'price_change_percentage_24h',defaultValue: 0.0)
  final double priceChangePercentage;


  CoinDataModel({
    required this.id,
    required this.symbol,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.priceChangePercentage,
  });


  factory CoinDataModel.fromJson(Map<String, dynamic> json) => _$CoinDataModelFromJson(json);

}
