import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../repositories/crypto_coins/crypto_coins.dart';
import '../widget/widget.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  List<CryptoCoin>? _cryptoCoinsList;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto app'),
      ),
      body: (_cryptoCoinsList == null) ? const Center(child: CircularProgressIndicator()) :
       ListView.separated(
        padding: const EdgeInsets.only(top: 16),
        itemCount: _cryptoCoinsList!.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (item, i) {
          final coin = _cryptoCoinsList![i];
          return CryptoCoinTile(coin: coin);
        },
      ),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await GetIt.I<AbstractCoinsRepository>().getCoinsList();
    setState(() {});
  }
}
