import 'dart:async';

import 'package:cool_alert/cool_alert.dart';

import 'package:dr_ramy/components/btn_widget3.dart';
import 'package:dr_ramy/modules/login/loginscreen.dart';
import 'package:dr_ramy/modules/mainpage/mainscreen.dart';
import 'package:dr_ramy/services/auth.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';



class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {



  final _formKey = GlobalKey<FormState>();
   String? password, name, phone,date, height, weight;
  bool enable = false;
  DateTime? dateTime;
  late Widget load=SizedBox();
  var _token;
  TextEditingController controller = new TextEditingController();
  Stream<String>? _tokenStream;
  Future<String> gettoken()async{
    print('here from get token');

    String? token;
    await FirebaseMessaging.instance.getToken(vapidKey:'AAAAXJUdjoI:APA91bErckha0rtTaxCFlbnv1DpL1zQ8XGYbQKzZ5tT-9_BeehLe5DOFXyToEPUEmEZsSZzyd2bLINCSkqI7-z-6qQObUrV8VzKdnS65QW0FVNK-lJC3wrQ3nOx3KkCL2AVX-GWhfvHn').then((value) {
      token=value;
      setToken(value!);
      _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
      _tokenStream!.listen(setToken);
    });
    // Auth().SendDeviceToken(63,token!).then((value) {
    //   print('sending token to backend \n'+value);
    // });
    return token!;

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
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),

          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Expanded(flex:2,child: buildDateFormField()),
              SizedBox(width: 5,),
              Expanded(flex:1,child:   Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    onChanged: (bool? value) {
                      setState(() {
                       enable = value!;
                      });
                    },
                    value: enable,
                  ),
                  Text(
                    'ليس بعد',
                    style: TextStyle(fontSize: getProportionateScreenWidth(15),),
                  ),
                ],
              ),)
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTallFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildWightFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          ButtonWidget3(
            color: kbuttonColor,
            btnText: "إنشاء حساب جديد",
            onClick: () async {
              // setState(() {
              //   load=CircularProgressIndicator();
              // });
              print('register button clicked');
              if (_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                print('all values are right');
                SharedPreferences.getInstance().then((value) async{
                  Auth().NewAccount
                    (phone!, password!, name!, date!, int.parse(height!),
                      int.parse(weight!), await gettoken()).then((value) {
                  print('account created '+phone!);

                  if (value["success"]==false) {
                  setState(() {
                  load=SizedBox();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Row(
                  children: [

                  Expanded(child: Text('${value["message"]},'+'please try again')),

                  Icon(Icons.cancel_rounded,color: Colors.red,),
                  ],
                  )));

                  } else {

                  setState(() {
                  load=SizedBox();
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>MainBody()));
                  showdialog();
                  }
                  // });
                  },
                  );
                });

              }
              }
              ),
          SizedBox(height: getProportionateScreenHeight(10)),

          load,
          // DropdownButton(


    ],
      ),
    );
  }
  TextFormField buildNameFormField(){
    return TextFormField(
        onSaved: (newValue) => name = newValue!,
        onChanged: (value) {
          setState(() {
            name = value;
          });
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "يرجى إدخال الإسم";
          } else {
            return null;
          }
        },
        decoration:CommonStyle.textFieldStyle(hintTextStr: 'اسم المستخدم ',w:  Icon(Icons.person,color: kbuttonColor2,))

    );
  }
  TextFormField buildPhoneFormField() {
    return TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(11)
        ],
      keyboardType: TextInputType.phone,
        onSaved: (newValue) => phone = newValue!,
        onChanged: (value) {
          setState(() {
            phone = value;
          });
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "يرجى إدخال رقم الهاتف";
          }
          if(val.length<11){
            return "يرجى إدخال رقم الهاتف بالكامل";
          }
            else {
            return null;
          }
        },
        decoration:CommonStyle.textFieldStyle(hintTextStr: 'رقم الهاتف ',w:  Icon(Icons.person,color: kbuttonColor2,))
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
          return "يرجى إدخال كلمة المرور";
        } if(val.length<9){
          return "كلمة المرور قصيرة جدا ,يرجى ادخال 9 عناصر او اكثر";
        }
        else {
          return null;
        }
      },
        decoration:CommonStyle.textFieldStyle(hintTextStr: ' كلمة المرور',w: Icon(Icons.lock,color: kbuttonColor2,))

    );
  }


  TextFormField buildDateFormField() {
    return TextFormField(

      onTap: ()
        {getdate(controller);},
        controller: controller,
      enabled: !enable,
      //  keyboardType: TextInputType.,
        onSaved: (newValue) => date = newValue!,
        onChanged: (value) {
          setState(() {
            date = value;
          });
        },
        decoration:CommonStyle.textFieldStyle(hintTextStr: 'تاريخ العملية',w:  InkWell(
          onTap: (){
            getdate(controller);
          },
            child: Icon(Icons.calendar_today,color: kbuttonColor2,)))

    );
  }
  void getdate(TextEditingController c) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now())
        .then((value) {
      setState(() {
        dateTime = value;
        c.text =
            dateTime!.year.toString() +
            '-' +
            dateTime!.month.toString() +
            '-' +
            dateTime!.day.toString();
        date=c.text;


        // newid_date=c.text;
        // newbirthdate=c.text;

        //id_date=c.text;
        //controller2.text=dateTime!.day.toString()+'-'+dateTime!.month.toString()+'-'+dateTime!.year.toString();
      });
    });
  }

  TextFormField buildTallFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => height = newValue!,
      onChanged: (value) {
        setState(() {
          height = value;
        });
      },
      validator: (val) {
        if (val!.isEmpty) {
          return "يرجى إدخال الطول";
        } else {
          return null;
        }
      },
        decoration:CommonStyle.textFieldStyle(hintTextStr: 'الطول',w:  Icon(Icons.accessibility,color: kbuttonColor2,))

    );
  }

  TextFormField buildWightFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => weight = newValue! ,
      onChanged: (value) {
        setState(() {
          weight = value;
        });
      },
      validator: (val) {
        if (val!.isEmpty) {
          return "يرجى إدخال الوزن";
        } else {
          return null;
        }
      },
        decoration:CommonStyle.textFieldStyle(hintTextStr: 'الوزن',w:  Icon(Icons.fitness_center_sharp ,color: kbuttonColor2,))

    );
  }

  Future<dynamic> showdialog(){

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogcontext) {
          return AlertDialog(
           // insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //contentPadding: EdgeInsets.zero,
            //clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 10,
            content: Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
               height: SizeConfig.screenHeight/3,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                   // height: 40,
                   // color: Colors.grey,
                    child: Center(
                      child: Icon(Icons.check_circle,color: Colors.green,size: 70,),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Text("تم إنشاء حسابك بنجاح اهلا بك في تطبيق دكتور رامي حلمي",textAlign: TextAlign.center,)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child:
                        ButtonWidget3(
                          btnText:"أبدأ الرحلة" ,
                          onClick:(){
                             Navigator.pop(dialogcontext);
                            print('to login'+phone!+' pass '+password!);

                            Auth().Login(phone!, password!).then((value) {
                              if (value.success==true){

                                SharedPreferences.getInstance().then((value) async{
                                  print('user id from login'+value.getInt('user_id').toString()+'\n'+'login click device token'+ gettoken().toString());
                                  Auth().SendDeviceToken(value.getInt('user_id')!,await gettoken()).then((value) {
                                    print('sending token to backend \n'+value.toString());
                                  });
                                });
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (c) => MainBody()));
                              }
                              else if(value.success==false) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(value.message)));
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (c) => LoginScreen()));
                              }


                            });

                            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>LoginScreen()));
                          },
                        )
                        // ElevatedButton(
                        //   onPressed: () {
                        //     Navigator.of(context).pop();
                        //     // exit(0);
                        //   },
                        //   child:
                        //   Text("أبدأ الرحلة", style: TextStyle(color: Colors.black)),
                        //   style: ElevatedButton.styleFrom(primary: Colors.white),
                        // ),
                      ),
                      SizedBox(width: 15),
                    ],
                  )
                ],
              ),
            ),
          );
        });


    CoolAlert.show(
      showCancelBtn: false,
      context: this.context,
      type: CoolAlertType.success,
      text: 'تم إنشاء حسابك بنجاح اهلا بك في تطبيق دكتور رامي حلمي',
      confirmBtnText: 'أبدأ الرحلة',
      onConfirmBtnTap: (){
      // Navigator.pop(context);
       print('to login'+phone!+' pass '+password!);

       Auth().Login(phone!, password!).then((value) {
        //Navigator.pop(context);
           if (value.success==true){
             SharedPreferences.getInstance().then((value) async{
               print('user id from login'+value.getInt('user_id').toString()+'\n'+'login click device token'+ gettoken().toString());
               Auth().SendDeviceToken(value.getInt('user_id')!,await gettoken()).then((value) {
                 print('sending token to backend \n'+value.toString());
               });
             });
             Navigator.pushReplacement(context,
                 MaterialPageRoute(builder: (c) => MainBody()));

           }
           else {
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                 content: Text('Login failed, Please Try Again')));
           }


       });

      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>LoginScreen()));
      },
      // cancelBtnText: 'Mobile Data',
      // onCancelBtnTap: (){
      //   // Navigator.pop(context);
      //   //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>CartScreen2()));
      //
      // },
      //confirmBtnColor: Colors.green,

    );
  }

}
