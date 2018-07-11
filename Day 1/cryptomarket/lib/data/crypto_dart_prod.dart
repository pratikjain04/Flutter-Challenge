import 'dart:async';
import 'package:cryptomarket/data/crypto_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ProdCryptoRepository implements CryptoRepository{
  //we have kept this String outside the method so we can refer to it everytime we need it outside the method
  String cryproUrl ="https://api.coinmarketcap.com/v1/ticker/?limit=50";
  @override
  Future<List<Crypto>> fetchCurrencies() async {

    http.Response response = await http.get(cryproUrl);
    //we are returning only after the await is over, i.e. the http.get() is executed completely first and then the return statement
    // ignore: deprecated_member_use
    final List responseBody = JSON.decode(response.body);
    final statusCode = response.statusCode;
    //Successful data retrieval has statusCode = 200
    if(statusCode != 200 || responseBody == null)
      throw new FetchDataException('An error Ocurred! : [Status Code: $statusCode]');

    return responseBody.map((c) => new Crypto.fromMap(c)).toList(); //c is just a variable




  }
}