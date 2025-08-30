import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  final String title;
  final String price;
  final String imageUrl;
  final String changePerDay;
  final String lowDay;
  final String highDay;

  const Coin(
      {required this.title,
      required this.price,
      required this.imageUrl,
      required this.changePerDay,
      required this.highDay,
      required this.lowDay});

  @override
  List<Object?> get props => [
        title,
        price,
        imageUrl,
        changePerDay,
        highDay,
        lowDay,
      ];
}
