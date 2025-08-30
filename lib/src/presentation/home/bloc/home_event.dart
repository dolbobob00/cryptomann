part of 'home_bloc.dart';

sealed class CoinsEvent extends Equatable {}

class CoinsloadEvent extends CoinsEvent {
  CoinsloadEvent({this.completer});
  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
