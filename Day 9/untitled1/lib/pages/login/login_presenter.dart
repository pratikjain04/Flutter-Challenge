import 'package:untitled1/data/rest_data.dart';
import 'package:untitled1/model/user.dart';

abstract class LoginPageContract{

  void onLoginSuccess(User user);
  void onLoginError(User user);
}

class LoginPagePresenter {
  LoginPageContract _view;
  RestData api = new RestData();  //this will be used if we make the RESTAPI of the website and make an app
  LoginPagePresenter(this._view);

  doLogin(String username, String password){
    api.login(username, password)
       .then((User user) => _view.onLoginSuccess(user))
       .catchError((onError) => _view.onLoginError(onError));
    
  }
}