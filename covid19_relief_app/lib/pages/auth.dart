import 'package:covid19_relief_app/bloc/auth_page_bloc/bloc/authpage_bloc.dart';
import 'package:covid19_relief_app/models/user_model.dart';
import 'package:covid19_relief_app/pages/splash.dart';
import 'package:covid19_relief_app/utils/colors.dart';
import 'package:covid19_relief_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Page { signin, signup }

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _fullname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  Page _selectedPage = Page.signin;
  // UsersDb _usersDb = UsersDb();
  bool _isLoading = false;
  bool _checkBoxTileVal = false;
  CustomColour _customColour = CustomColour();
  // String _text1;
  // String _text2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _key,
        body: BlocListener<AuthpageBloc, AuthpageState>(listener:
            (context, state) {
          if (state is LoginFaliure) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ));
          }
        }, child:
            BlocBuilder<AuthpageBloc, AuthpageState>(builder: (context, state) {
          if (state is AuthpageInitial) {
            return Stack(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 50.0),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 50.0, 0.0, 0.0),
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Covid-19',
                                      style: TextStyle(
                                          color: _customColour.color1,
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      'Relief',
                                      style: TextStyle(
                                          color: _customColour.color2,
                                          fontSize: 35.0,
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 60.0),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedPage = Page.signin;
                                    });
                                  },
                                  child: Text(
                                    'Sign In',
                                    // _selectedPage == Page.signin
                                    // ? 'Sign In'
                                    // : 'Sign Up',
                                    style: TextStyle(
                                        color: _selectedPage == Page.signin
                                            ? _customColour.color1
                                            : _customColour.color2,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                                Expanded(
                                    child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedPage = Page.signup;
                                    });
                                    // if (_selectedPage == Page.signin) {
                                    //   setState(() {
                                    //     // _text2 = 'Sign In';
                                    //     // _text1 = 'Sign Up';
                                    //     _selectedPage = Page.signup;
                                    //   });
                                    // } else if (_selectedPage == Page.signup) {
                                    //   // _text2 = 'Sign Up';
                                    //   // _text1 = 'Sign In';
                                    //   _selectedPage = Page.signin;
                                    // }
                                  },
                                  child: Text(
                                    'Sign Up',
                                    // _selectedPage == Page.signin
                                    //     ? 'Sign Up'
                                    //     : 'Sign In',
                                    style: TextStyle(
                                        color: _selectedPage == Page.signup
                                            ? _customColour.color1
                                            : _customColour.color2,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                              ],
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).size.height / 2.5,
                              child: _loadScreen(context),
                            )
                          ],
                        )),
                  ),
                ),
              ],
            );
          } else if (state is AuthpageLoading) {
            return Loading();
          } else {
            return Loading();
            // return Stack(
            //   children: <Widget>[
            //     Container(
            //       child: Padding(
            //         padding: const EdgeInsets.all(0.0),
            //         child: Container(
            //             height: MediaQuery.of(context).size.height,
            //             decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.circular(16),
            //             ),
            //             child: Column(
            //               children: <Widget>[
            //                 SizedBox(height: 50.0),
            //                 Padding(
            //                   padding: const EdgeInsets.fromLTRB(
            //                       0.0, 50.0, 0.0, 0.0),
            //                   child: Container(
            //                     alignment: Alignment.center,
            //                     child: Column(
            //                       children: <Widget>[
            //                         Text(
            //                           'Covid-19',
            //                           style: TextStyle(
            //                               color: _customColour.color1,
            //                               fontSize: 40.0,
            //                               fontWeight: FontWeight.bold),
            //                         ),
            //                         SizedBox(
            //                           height: 5.0,
            //                         ),
            //                         Text(
            //                           'Relief',
            //                           style: TextStyle(
            //                               color: _customColour.color2,
            //                               fontSize: 35.0,
            //                               fontStyle: FontStyle.normal),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //                 SizedBox(height: 60.0),
            //                 Row(
            //                   children: <Widget>[
            //                     Expanded(
            //                         child: FlatButton(
            //                       onPressed: () {
            //                           _selectedPage = Page.signin;
            //                       },
            //                       child: Text(
            //                         'Sign In',
            //                         // _selectedPage == Page.signin
            //                         //     ? 'Sign In'
            //                         //     : 'Sign Up',
            //                         style: TextStyle(
            //                             color:_selectedPage == Page.signin ? _customColour.color1 : _customColour.color2,
            //                             fontSize: 30.0,
            //                             fontWeight: FontWeight.bold),
            //                       ),
            //                     )),
            //                     Expanded(
            //                         child: FlatButton(
            //                       onPressed: () {
            //                           _selectedPage = Page.signup;
            //                         // if (_selectedPage == Page.signin) {
            //                         //   setState(() {
            //                         //     // _text2 = 'Sign In';
            //                         //     // _text1 = 'Sign Up';
            //                         //     _selectedPage = Page.signup;
            //                         //   });
            //                         // } else if (_selectedPage == Page.signup) {
            //                         //   // _text2 = 'Sign Up';
            //                         //   // _text1 = 'Sign In';
            //                           // _selectedPage = Page.signin;
            //                         // }
            //                       },
            //                       child: Text('Sign Up',
            //                         // _selectedPage == Page.signin
            //                         //     ? 'Sign Up'
            //                         //     : 'Sign In',
            //                         style: TextStyle(
            //                             color: _selectedPage == Page.signup ? _customColour.color1 : _customColour.color2,
            //                             fontSize: 30.0,
            //                             fontWeight: FontWeight.bold),
            //                       ),
            //                     )),
            //                   ],
            //                 ),
            //                 Container(
            //                   height: MediaQuery.of(context).size.height -
            //                       MediaQuery.of(context).size.height / 2.5,
            //                   child: _loadScreen(context),
            //                 )
            //               ],
            //             )),
            //       ),
            //     ),
            //   ],
            // );
          }
        })));
  }

  Widget _loadScreen(BuildContext context) {
    switch (_selectedPage) {
      case Page.signup:
        return Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 10.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: TextFormField(
                        controller: _fullname,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Full name",
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 10.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);
                            if (!regex.hasMatch(value))
                              return 'Please make sure your email address is valid';
                            else
                              return null;
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 10.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: TextFormField(
                        controller: _password,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "The password field cannot be empty";
                          } else if (value.length < 6) {
                            return "the password has to be at least 6 characters long";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 10.0),
                  child: CheckboxListTile(
                    value: _checkBoxTileVal,
                    onChanged: (newvalue) {
                      setState(() => _checkBoxTileVal = newvalue);
                    },
                    title: Text("I agree with terms and conditions"),
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 10.0),
                  child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      color: _customColour.color1,
                      elevation: 0.0,
                      child: MaterialButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            UserModel user_details = UserModel.fromJson({
                              "email": _email.text.toString(),
                              "password": _password.text.toString(),
                              "user_accounts": {
                                "full_name": _fullname.text.toString(),
                                "total_amount": 0.00,
                                "projects_supported": 0
                              }
                            });

                            BlocProvider.of<AuthpageBloc>(context)
                                .add(SignUpButtonPressed(user_details));
                            // if (await _usersDb.validateEmail(
                            //     _email.text, _password.text)) {
                            //   //     setState(() {
                            //   //   _isLoading = false;
                            //   // });
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             BasePage()));
                            // } else {
                            //   // setState(() {
                            //   //   _isLoading = false;
                            //   // });
                            //   _key.currentState.showSnackBar(SnackBar(
                            //       content: Text(
                            //           "Login falied! Wrong Input details")));
                            // }
                          }
                        },
                        minWidth: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 90.0,
                            ),
                            Text(
                              "Sign Up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                            SizedBox(
                              width: 80.0,
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 10.0),
                  child: Center(
                    child: Text(
                      "Already have an account, Sign in.",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 35.0, 30.0, 10.0),
                  child: Center(
                    child: Text(
                      "Terms of use. Privacy policy",
                    ),
                  ),
                ),
              ],
            ));
        break;

      case Page.signin:
        return Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 10.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);
                            if (!regex.hasMatch(value))
                              return 'Please make sure your email address is valid';
                            else
                              return null;
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 10.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: TextFormField(
                        controller: _password,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "The password field cannot be empty";
                          } else if (value.length < 6) {
                            return "the password has to be at least 6 characters long";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 10.0),
                  child: CheckboxListTile(
                    value: _checkBoxTileVal,
                    onChanged: (newvalue) {
                      setState(() => _checkBoxTileVal = newvalue);
                    },
                    title: Text("Remember me"),
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 10.0),
                  child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      color: _customColour.color1,
                      elevation: 0.0,
                      child: MaterialButton(
                        onPressed: () async {
                          UserLoginModel user_details =
                              UserLoginModel.fromJson({
                            "email": _email.text.toString(),
                            "password": _password.text.toString(),
                          });

                          BlocProvider.of<AuthpageBloc>(context)
                              .add(LoginButtonPressed(user_details));
                          // if (_formKey.currentState.validate()) {
                          //   // _formKey.currentState.dispose();
                          //   // setState(() {
                          //   //   _isLoading = true;

                          //   // });
                          //   if (await _usersDb.validateEmail(
                          //       _email.text, _password.text)) {
                          //     //     setState(() {
                          //     //   _isLoading = false;
                          //     // });
                          //     Navigator.pushReplacement(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) =>
                          //                 BasePage()));
                          //   } else {
                          //     // setState(() {
                          //     //   _isLoading = false;
                          //     // });
                          //     _key.currentState.showSnackBar(SnackBar(
                          //         content: Text(
                          //             "Login falied! Wrong Input details")));
                          //   }
                          // }
                        },
                        minWidth: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 90.0,
                            ),
                            Text(
                              "Sign In",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                            SizedBox(
                              width: 80.0,
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 10.0),
                  child: Center(
                    child: Text(
                      "Forgot Password ?",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 10.0),
                  child: Center(
                    child: Text(
                      "Terms of use. Privacy policy",
                    ),
                  ),
                ),
              ],
            ));
        break;
    }
  }
}
