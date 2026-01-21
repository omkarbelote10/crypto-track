import 'package:json_annotation/json_annotation.dart';

part 'current_price.g.dart';

@JsonSerializable()
class CurrentPrice {
  final double usd;
  final double inr;

  CurrentPrice({required this.usd, required this.inr});
  factory CurrentPrice.fromJson(Map<String,dynamic> json) => _$CurrentPriceFromJson(json);
}