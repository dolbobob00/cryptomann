import 'package:cryptomann/src/data/coin/coin.dart';
export 'package:cryptomann/src/domain/settings/settings.dart';
export 'package:dio/dio.dart';
export 'package:flutter/material.dart';
export 'package:cryptomann/src/data/coin/coin.dart';

abstract class ICoinsRepository {
  Future<List<Coin>> getAllCoins();
}
