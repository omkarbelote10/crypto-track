// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinDataModel _$CoinDataModelFromJson(Map<String, dynamic> json) =>
    CoinDataModel(
      id: json['id'] as String,
      symbol: json['symbol'] as String? ?? 'null',
      image: json['image'] as String? ?? 'null',
      currentPrice: (json['current_price'] as num?)?.toDouble() ?? 0.0,
      marketCap: (json['market_cap'] as num?)?.toInt() ?? 0,
      priceChangePercentage:
          (json['price_change_percentage_24h'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$CoinDataModelToJson(CoinDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'image': instance.image,
      'current_price': instance.currentPrice,
      'market_cap': instance.marketCap,
      'price_change_percentage_24h': instance.priceChangePercentage,
    };
