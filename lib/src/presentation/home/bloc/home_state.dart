part of 'home_bloc.dart';

sealed class CoinsState {}

class CoinsInitial implements CoinsState {}

class CoinsLoading implements CoinsState {}

class CoinsLoaded implements CoinsState {
  final List<Coin> coins;
  CoinsLoaded({required this.coins});
}

class CoinsError implements CoinsState {
  String? error;
  CoinsError({this.error});
}
