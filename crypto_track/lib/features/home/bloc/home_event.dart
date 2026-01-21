part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent{
  final Currency currency;

  HomeInitialEvent({required this.currency});
}

class HomeCoinTileClickedEvent extends HomeEvent{
  final String coinId;
  HomeCoinTileClickedEvent({required this.coinId});
}

class HomeFetchMoreEvent extends HomeEvent{}

class HomeRefreshEvent extends HomeEvent{}
