// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentPrice _$CurrentPriceFromJson(Map<String, dynamic> json) => CurrentPrice(
  usd: (json['usd'] as num).toDouble(),
  inr: (json['inr'] as num).toDouble(),
);

Map<String, dynamic> _$CurrentPriceToJson(CurrentPrice instance) =>
    <String, dynamic>{'usd': instance.usd, 'inr': instance.inr};
