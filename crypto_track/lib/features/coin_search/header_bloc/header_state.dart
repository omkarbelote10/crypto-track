part of 'header_bloc.dart';

@immutable
sealed class HeaderState {}

final class HeaderInitial extends HeaderState {}

class HeaderTrendingState extends HeaderState{}
class HeaderSearchedState extends HeaderState{}