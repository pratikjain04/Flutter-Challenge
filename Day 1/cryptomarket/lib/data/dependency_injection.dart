import 'package:cryptomarket/data/crypto_data.dart';
import 'package:cryptomarket/data/crypto_data_mock.dart';
import 'package:cryptomarket/data/crypto_dart_prod.dart';

enum Flavor {MOCK, PROD}

//DEPENDENCY INJECTION

class Injector{
  static final Injector singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor){
    _flavor = flavor;
  }

  factory Injector(){
      return singleton;
  }

  Injector._internal();

  CryptoRepository get cryptoRepository{

    switch(_flavor){
      case Flavor.MOCK: return new MockCryptoRepository();
      default: return new ProdCryptoRepository();
    }


  }

}