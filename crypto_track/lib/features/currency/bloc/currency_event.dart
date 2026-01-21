part of 'currency_bloc.dart';

@immutable
sealed class CurrencyEvent {}

class CurrencyChangeEvent extends CurrencyEvent{

  CurrencyChangeEvent();
}
