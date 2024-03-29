import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AID,BRAT,BTO,DOV,SOL,CAG&tsyms=USD'
    );

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinList = dataRaw.entries.map((e) {
      final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];

     return  CryptoCoin(
      name: e.key,
      priceInUSD: price,
      imageUrl: 'https://cryptocompare.com/media$imageUrl'
    );
    }).toList();
    return cryptoCoinList;
  }
}