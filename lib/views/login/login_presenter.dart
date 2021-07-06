import 'package:flutter/material.dart';
import 'package:mobile_pdam/common/ui/app_circullar.dart';
import 'package:mobile_pdam/common/ui/app_succesDialog.dart';
import 'package:mobile_pdam/utils/request.dart';
import 'package:one_context/one_context.dart';

class LoginViewContract {
  void toast(String message) {}
  void refreshData(LoginViewModel model) {}
  void sukses() {}
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
    OneContext().showProgressIndicator(
      builder: (_) => AppCircullar(),
    );

    final response = await Requests().post("api/login", body: {
      "email": _appModel.username.text,
      "password": _appModel.password.text,
    });

    // this._view.dialog(response.data);
    OneContext().hideProgressIndicator();
    this._view.sukses();
    print(response.code);
  }
}
