import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:cryptomann/src/data/repository/coins_repo/abstract_coins_repo.dart';
import 'package:cryptomann/src/domain/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'home_event.dart';
part 'home_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  final ICoinsRepository coinsRepository;
  final Talker talker;
  CoinsBloc({required this.coinsRepository, required this.talker})
      : super(
          CoinsInitial(),
        ) {
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
        } catch (error, stacktrace) {
          emit(
            CoinsError(
              error: error.toString(),
            ),
          );
          talker.handle(error, stacktrace);
        } finally {
          event.completer?.complete();
        }
      },
    );
  }
  //Error handler bloc
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    talker.handle(error, stackTrace);
  }
}
