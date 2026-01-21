import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_coin_data_model.g.dart';

@JsonSerializable()
class SearchCoinDataModel {
  @JsonKey(defaultValue: 'null',)
  String id;
  @JsonKey(defaultValue: 'null',)
  String symbol;
  @JsonKey(defaultValue: 'null')
  String name;
  @JsonKey(name: 'thumb',defaultValue: 'null',)
  String imageThumb;
  @JsonKey(name: 'market_cap_rank', defaultValue: null,)
  int? marketCapRank;

  SearchCoinDataModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.imageThumb,
    required this.marketCapRank,
  });

  factory SearchCoinDataModel.fromJson(Map<String,dynamic> json) => _$SearchCoinDataModelFromJson(json);
}