// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_coin_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCoinDataModel _$SearchCoinDataModelFromJson(Map<String, dynamic> json) =>
    SearchCoinDataModel(
      id: json['id'] as String? ?? 'null',
      name: json['name'] as String? ?? 'null',
      symbol: json['symbol'] as String? ?? 'null',
      imageThumb: json['thumb'] as String? ?? 'null',
      marketCapRank: (json['market_cap_rank'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchCoinDataModelToJson(
  SearchCoinDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'symbol': instance.symbol,
  'name': instance.name,
  'thumb': instance.imageThumb,
  'market_cap_rank': instance.marketCapRank,
};
