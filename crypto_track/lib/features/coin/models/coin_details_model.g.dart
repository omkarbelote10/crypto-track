// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinDetailsModel _$CoinDetailsModelFromJson(Map<String, dynamic> json) =>
    CoinDetailsModel(
      name: json['name'] as String? ?? 'null',
      symbol: json['symbol'] as String? ?? 'null',
      merketCapData: MarketCapDataModel.fromJson(
        json['market_data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CoinDetailsModelToJson(CoinDetailsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'symbol': instance.symbol,
      'market_data': instance.merketCapData,
    };
