part of 'home_bloc.dart';


sealed class CoinsState extends Equatable {}

class CoinsInitial extends CoinsState {
  @override
  List<Object?> get props => [];
}

class CoinsLoading extends CoinsState {
  @override
  List<Object?> get props => [];
}

class CoinsLoaded extends CoinsState {
  final List<Coin> coins;
  CoinsLoaded({required this.coins});

  @override
  List<Object?> get props => [coins];
}

class CoinsError extends CoinsState {
  final String? error;
  CoinsError({this.error});

  @override
  List<Object?> get props => [error];
}
