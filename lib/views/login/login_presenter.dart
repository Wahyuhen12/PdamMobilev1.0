import 'package:flutter/material.dart';
import 'package:mobile_pdam/utils/request.dart';

class LoginViewContract {
  void toast(String message) {}
  void refreshData(LoginViewModel model) {}
}

class LoginViewModel {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  String result = "";
}

class LoginViewPresenter {
  LoginViewContract _view;
  LoginViewModel _appModel;
  LoginViewPresenter(this._view) {
    this._appModel = LoginViewModel();
    this._view.refreshData(_appModel);
  }

  void buttonLogin() async {
    final response = await Requests().post("api/login", body: {
      "email": _appModel.username.text,
      "password": _appModel.password.text,
    });

    print(response.code);
  }
}
