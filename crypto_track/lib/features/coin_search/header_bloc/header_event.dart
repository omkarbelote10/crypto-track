part of 'header_bloc.dart';

@immutable
sealed class HeaderEvent {}

class HeaderSearchedEvent extends HeaderEvent{}

class HeaderEmptyEvent extends HeaderEvent{}