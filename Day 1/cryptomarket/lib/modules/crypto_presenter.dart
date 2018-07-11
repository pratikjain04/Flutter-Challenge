import 'package:cryptomarket/data/crypto_data.dart';
import 'package:cryptomarket/data/dependency_injection.dart';

abstract class CryptoListViewContract {
  void onLoadCryptoComplete(List<Crypto> items);
  void onLoadCryptoError();
}

//Creating the Presenter Class

class CryptoListPresenter{

  CryptoListViewContract _view;
  CryptoRepository _repository;

  CryptoListPresenter(this._view){
    _repository = new Injector().cryptoRepository;
    //we cannot create more than one instance of Injector class because it is a singleton
    }

    void loadCurrencies(){
    _repository.fetchCurrencies()
               .then((c)=>_view.onLoadCryptoComplete(c))
               .catchError((onError) => _view.onLoadCryptoError());

    }

}
