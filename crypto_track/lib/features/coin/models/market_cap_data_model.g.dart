// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_cap_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketCapDataModel _$MarketCapDataModelFromJson(Map<String, dynamic> json) =>
    MarketCapDataModel(
      marketCapRank: (json['market_cap_rank'] as num?)?.toInt(),
      priceChangePercentage24H: (json['price_change_percentage_24h'] as num?)
          ?.toDouble(),
      priceChangePercentage7D: (json['price_change_percentage_7d'] as num?)
          ?.toDouble(),
      priceChangePercentage14D: (json['price_change_percentage_14d'] as num?)
          ?.toDouble(),
      priceChangePercentage30D: (json['price_change_percentage_30d'] as num?)
          ?.toDouble(),
      priceChangePercentage60D: (json['price_change_percentage_60d'] as num?)
          ?.toDouble(),
      priceChangePercentage1Y: (json['price_change_percentage_1y'] as num?)
          ?.toDouble(),
      currentPrice: CurrentPrice.fromJson(
        json['current_price'] as Map<String, dynamic>,
      ),
      totalSupply: (json['total_supply'] as num?)?.toDouble(),
      maxSupply: (json['max_supply'] as num?)?.toDouble(),
      lastUpdated: json['last_updated'] as String?,
    );

Map<String, dynamic> _$MarketCapDataModelToJson(MarketCapDataModel instance) =>
    <String, dynamic>{
      'current_price': instance.currentPrice,
      'market_cap_rank': instance.marketCapRank,
      'price_change_percentage_24h': instance.priceChangePercentage24H,
      'price_change_percentage_7d': instance.priceChangePercentage7D,
      'price_change_percentage_14d': instance.priceChangePercentage14D,
      'price_change_percentage_30d': instance.priceChangePercentage30D,
      'price_change_percentage_60d': instance.priceChangePercentage60D,
      'price_change_percentage_1y': instance.priceChangePercentage1Y,
      'total_supply': instance.totalSupply,
      'max_supply': instance.maxSupply,
      'last_updated': instance.lastUpdated,
    };
