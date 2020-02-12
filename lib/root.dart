import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:under_provider/states/app_state.dart';

class Root extends StatefulWidget {
  Root({Key key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      // maxLength: 20,
                      // textAlign: TextAlign.center, // Horizontal and Vertical
                      // textAlignVertical: TextAlignVertical.center,
                      maxLines: 1,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Email Field is empty';
                        } else if (!val.contains('@')) {
                          return 'Email needs to have an @ symbol';
                        } else if (val.contains(' ')) {
                          return 'Email has an extra space';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.7),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Email",
                        errorText: appState.emailErrorMsg,
                        errorStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            color: appState.emailValid == 'none'
                                ? Colors.blue
                                : appState.emailValid == 'true'
                                    ? Colors.green
                                    : Colors.red,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            color: appState.emailValid == 'none'
                                ? Colors.blue
                                : appState.emailValid == 'true'
                                    ? Colors.green
                                    : Colors.red,
                            width: 2,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        icon: Icon(
                          Icons.email,
                          color: appState.emailValid == 'none'
                              ? Colors.blue
                              : appState.emailValid == 'true'
                                  ? Colors.green
                                  : Colors.red,
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focus);
                      },
                      onChanged: (value) async {
                        // ename = value;
                        var errorEmail = await appState.verifyEmail(value);
                        print(errorEmail);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      focusNode: focus,
                      keyboardAppearance: Brightness.dark,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: appState.passwordValid == 'none'
                              ? Colors.blue
                              : appState.passwordValid == 'true'
                                  ? Colors.green
                                  : Colors.red,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.7),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Password",
                        errorText: appState.passwordErrorMsg,
                        errorStyle: TextStyle(color: Colors.red, fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            color: appState.passwordValid == 'none'
                                ? Colors.blue
                                : appState.passwordValid == 'true'
                                    ? Colors.green
                                    : Colors.red,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            color: appState.passwordValid == 'none'
                                ? Colors.blue
                                : appState.passwordValid == 'true'
                                    ? Colors.green
                                    : Colors.red,
                            width: 2,
                          ),
                        ),
                      ),
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) async {
                        // pname = value;
                        // ename = value;
                        var errorPassword =
                            await appState.verifyPassword(value);
                        print(errorPassword);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
