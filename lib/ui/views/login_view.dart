import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_management/core/constants/app_constants.dart';
import 'package:turf_management/core/viewmodels/view/login_view_model.dart';
import 'package:turf_management/ui/views/base_widget.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordController = TextEditingController();
  Map<String, String> authData = {'username': '', 'password': ''};

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(authenticationService: Provider.of(context)),
      child: Image.asset(
        "assets/logo.png",
        height: 250,
      ),
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            height: deviceSize.height,
            width: deviceSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                child,
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 8,
                  child: Container(
                    height: 265,
                    width: deviceSize.width * .75,
                    padding: EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'User name',
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter your user name';
                              }
                            },
                            onSaved: (value) {
                              authData['username'] = value;
                            },
                          ),
                          if (model.data['username'] != null)
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 200),
                              child: Text(
                                model.data['username'],
                                style:
                                    TextStyle(color: Colors.red, fontSize: 10),
                              ),
                            ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            controller: _passwordController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter your password';
                              }
                            },
                            onSaved: (value) {
                              authData['password'] = value;
                            },
                          ),
                          if (model.data['password'] != null)
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 180),
                              child: Text(
                                model.data['password'],
                                style:
                                    TextStyle(color: Colors.red, fontSize: 10),
                              ),
                            ),
                          SizedBox(
                            height: 15,
                          ),
                          model.busy
                              ? CircularProgressIndicator()
                              : RaisedButton(
                                  child: Text("Login"),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 8.0),
                                  color: Theme.of(context).primaryColor,
                                  textColor: Theme.of(context)
                                      .primaryTextTheme
                                      .button
                                      .color,
                                  onPressed: () async {
                                    if (!_formKey.currentState.validate()) {
                                      return;
                                    }
                                    _formKey.currentState.save();
                                    var loginSuccess = await model.login(
                                        authData['username'],
                                        authData["password"]);
                                    if (loginSuccess) {
                                      Navigator.pushNamed(
                                          context, RoutePaths.DashBoard);
                                    }
                                  },
                                )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
