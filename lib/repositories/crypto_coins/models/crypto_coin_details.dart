import 'package:crypto_coins_list/repositories/crypto_coins/models/models.dart';

class CryptoCoinDetails extends CryptoCoin {
  const CryptoCoinDetails({
    required super.name,
    required super.priceInUSD,
    required super.priceInEUR,
    required super.imageUrl,
    required this.lastUpdate,
    required this.high24Hour,
    required this.low24Hour,
  });

  final DateTime lastUpdate;
  final double high24Hour;
  final double low24Hour;

  @override
  List<Object> get props => super.props
    ..addAll([
      lastUpdate,
      high24Hour,
      low24Hour,
    ]);
}
