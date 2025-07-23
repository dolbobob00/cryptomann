part of 'home_bloc.dart';

sealed class CoinsEvent {}

class CoinsloadEvent extends CoinsEvent {
  CoinsloadEvent({this.completer});
  final Completer? completer;
}
