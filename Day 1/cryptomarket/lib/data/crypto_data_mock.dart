import 'dart:async';
import 'package:cryptomarket/data/crypto_data.dart';

class MockCryptoRepository implements CryptoRepository{

  @override
  Future<List<Crypto>> fetchCurrencies() {
    return new Future.value(currencies);
  }
}

  //The Test Data, to check whether all the code is working properly.
  //1. The data is being pulled from the backend to the UI successfully
  //2. The UI is being loaded as we want it to be.

  var currencies = <Crypto>[
    new Crypto(name: 'Bitcoin', price_usd: '8918.64' ,percent_change_1h: '-0.7'),
    new Crypto(name: 'Ethereum', price_usd: '591.14' ,percent_change_1h: '0.31'),
    new Crypto(name: 'Ripple', price_usd: '0.64' ,percent_change_1h: '-0.9'),
  ];

