class CryptoCoin {
  const CryptoCoin(
      {required this.name,
      required this.priceInUSD,
      required this.priceInEUR,
      required this.imageUrl});

  final String name;
  final double priceInUSD;
  final double priceInEUR;
  final String imageUrl;
}
