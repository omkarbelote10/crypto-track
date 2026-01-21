part of 'coin_bloc.dart';

@immutable
sealed class CoinEvent {}

class CoinInitialEvent extends CoinEvent{
  final String coinId;

  CoinInitialEvent({required this.coinId});
}

