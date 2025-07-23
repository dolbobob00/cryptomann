import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:cryptomann/src/domain/repository/coins_repo/abstract_coins_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  final ICoinsRepository coinsRepository;
  CoinsBloc({required this.coinsRepository}) : super(CoinsInitial()) {
    on<CoinsloadEvent>(
      (event, emit) async {
        if (state is! CoinsLoaded) {
          emit(
            CoinsLoading(),
          );
        }
        try {
          final List<Coin> coins = await coinsRepository.getAllCoins();
          emit(
            CoinsLoaded(
              coins: coins,
            ),
          );
        } catch (e) {
          emit(
            CoinsError(
              error: e.toString(),
            ),
          );
        } finally {
          event.completer?.complete();
        }
      },
    );
  }
}
