import 'package:flutter/material.dart';
import 'package:mobile_pdam/common/ui/app_button.dart';
import 'package:mobile_pdam/common/ui/app_colors.dart';
import 'package:mobile_pdam/common/ui/app_password.dart';
import 'package:mobile_pdam/common/ui/app_text.dart';
import 'package:mobile_pdam/views/login/login_presenter.dart';
import 'package:mobile_pdam/common/ui/app_succesDialog.dart';
import 'package:one_context/one_context.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> implements LoginViewContract {
  LoginViewModel _appModel = LoginViewModel();
  LoginViewPresenter _presenter;

  @override
  void initState() {
    super.initState();
    OneContext().key = GlobalKey<NavigatorState>();
    _presenter = LoginViewPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: AppColors.textLoginColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: AppText(
                    text: "Username",
                    texteditingController: _appModel.username,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: AppPassword(
                    passwordController: _appModel.password,
                    text: "Paswword",
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: new AppButton(
                      ontap: () {
                        // _presenter.buttonLogin();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginView(),
                          ),
                        );
                      },
                      text: "Login",
                      color: AppColors.buttonPrimaryColor,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void sukses() {
    Navigator.pushNamed(context, "/dashboardView");
  }

  @override
  void refreshData(LoginViewModel model) {
    setState(() {
      this._appModel = model;
    });
  }

  @override
  void toast(String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AppSuccesDialog();
      },
    );
  }
}
