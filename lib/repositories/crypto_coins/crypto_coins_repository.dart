import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';

class CryptoCoinRepository implements AbstractCoinsRepository {
  CryptoCoinRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,1ST,1WO,AAC,ABCC,ABT,ABYSS,ACCN,ACE,ADA,ADB,ADH,ADI,ADL,ADT,ADX,AE,AEN,AERGO,AGI,AGVC,AID,AIDOC,AIT,AIX,ALIS,ALX,AMB,ANKR,ANT,AOA,APIS&tsyms=USD,EUR');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final eurData =
          (e.value as Map<String, dynamic>)['EUR'] as Map<String, dynamic>;
      final priceInUSD = usdData['PRICE'];
      final priceInEUR = eurData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];

      return CryptoCoin(
          name: e.key,
          priceInUSD: priceInUSD,
          priceInEUR: priceInEUR,
          imageUrl: 'https://www.cryptocompare.com/$imageUrl');
    }).toList();
    return cryptoCoinsList;
  }
}
