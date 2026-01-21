import 'package:crypto_track/features/coin/models/market_cap_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'coin_details_model.g.dart';

@JsonSerializable()
class CoinDetailsModel {
  @JsonKey(defaultValue: 'null',)
  final String? name;
  @JsonKey(defaultValue: 'null',)
  final String? symbol;
  @JsonKey(name: 'market_data')
  final MarketCapDataModel merketCapData;

    CoinDetailsModel({
      required this.name,
      required this.symbol,
      required this.merketCapData,
    });

    factory CoinDetailsModel.fromJson(Map<String,dynamic> json) => _$CoinDetailsModelFromJson(json);
}