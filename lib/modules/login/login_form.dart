import 'package:dr_ramy/components/btn_widget.dart';
import 'package:dr_ramy/components/btn_widget2.dart';
import 'package:dr_ramy/modules/mainpage/mainscreen.dart';
import 'package:dr_ramy/modules/register/register_screen.dart';
import 'package:dr_ramy/services/auth.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late String phone;
  late String password;
  late Widget load = SizedBox();
  var _token;
  Stream<String>? _tokenStream;
  Future<String> gettoken() async {
    print('here from get token');


    await FirebaseMessaging.instance
        .getToken(
            vapidKey:
                'AAAAXJUdjoI:APA91bErckha0rtTaxCFlbnv1DpL1zQ8XGYbQKzZ5tT-9_BeehLe5DOFXyToEPUEmEZsSZzyd2bLINCSkqI7-z-6qQObUrV8VzKdnS65QW0FVNK-lJC3wrQ3nOx3KkCL2AVX-GWhfvHn')
        .then((value) {
          print(value.toString());
      _token = value.toString();
      setToken(value!);
      _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
      _tokenStream!.listen(setToken);
    });
    // Auth().SendDeviceToken(63,token!).then((value) {
    //   print('sending token to backend \n'+value);
    // });
    return _token!;
  }

  void setToken(String token) {
    print('FCM Token: $token');
    setState(() {
      _token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: ButtonWidget(
                  btnText: "تسجيل الدخول",
                  onClick: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                         setState(() {
                            load = CircularProgressIndicator(
                              color: kPrimaryColor,
                            );
                          });
                       Auth().Login(phone, password).then((value)  {
                        if (value.success == true) {
                       
                          // firebaseHandle();
                           SharedPreferences.getInstance().then((value) async {
                             print('user id from login ' +
                                value.getInt('user_id').toString() +
                                '\n' +
                                'login click device token ' +
                                 gettoken().toString());
                            Auth()
                                .SendDeviceToken(
                                    value.getInt('user_id')!, await gettoken())
                                .then((value) {
                              print('sending token to backend \n' +
                                  value.toString());
                            });
                          });
                          // Navigator.pushReplacement(context,
                          //     MaterialPageRoute(builder: (c) => MainBody()));
                        } else if (value.success == false) {
                          setState(() {
                            load = SizedBox();
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(value.message)));
                        }
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login failed')));
                    }
                  },
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 1,
                child: ButtonWidget2(
                  btnText: "انشاء حساب جديد",
                  onClick: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (c) => RegisterScreen()));
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          load,

          //  SizedBox(height: getProportionateScreenHeight(10)),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
        obscureText: true,
        onSaved: (newValue) => password = newValue!,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "يرجى ادخال كلمة المرور";
          } else {
            return null;
          }
        },
        decoration: CommonStyle.textFieldStyle(
            hintTextStr: 'ادخل كلمة المرور',
            w: Icon(
              Icons.lock,
              color: kbuttonColor2,
            )));
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
        inputFormatters: [LengthLimitingTextInputFormatter(11)],
        keyboardType: TextInputType.phone,
        onSaved: (newValue) => phone = newValue!,
        onChanged: (value) {
          setState(() {
            phone = value;
          });
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "يرجى ادخال رقم الهاتف";
          }
          if (val.length < 11) {
            return "يرجى إدخال رقم الهاتف بالكامل";
          } else {
            return null;
          }
        },
        decoration: CommonStyle.textFieldStyle(
            hintTextStr: 'ادخل رقم الهاتف',
            w: Icon(
              Icons.person,
              color: kbuttonColor2,
            )));
  }
}
