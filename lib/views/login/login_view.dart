import 'package:flutter/material.dart';
import 'package:mobile_pdam/common/ui/app_button.dart';
import 'package:mobile_pdam/common/ui/app_colors.dart';
import 'package:mobile_pdam/common/ui/app_password.dart';
import 'package:mobile_pdam/common/ui/app_text.dart';
import 'package:mobile_pdam/views/login/login_presenter.dart';

class LoginView extends StatefulWidget {
  LoginBasicPresenter presenter;
  LoginView(this.presenter,{Key key}) : super(key: key);
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>{
  AppModel appModel = AppModel();
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
                    texteditingController: appModel.username,  
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: AppPassword(
                    passwordController: appModel.password,
                    text: "Paswword",
                    ),
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
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
                      ontap: (){
                       this.widget.presenter.buttonClick(context);
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
}
