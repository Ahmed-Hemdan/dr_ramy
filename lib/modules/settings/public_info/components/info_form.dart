
import 'package:dr_ramy/components/btn_widget3.dart';
import 'package:dr_ramy/models/profile_info.dart';
import 'package:dr_ramy/modules/mainpage/mainscreen.dart';

import 'package:dr_ramy/services/auth.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class UpdateForm extends StatefulWidget {
  @override
  _UpdateFormState createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {

  final _formKey = GlobalKey<FormState>();
   String? password, name, phone,date, height, weight;
  UserData? info;
  late Widget load=SizedBox();
  TextEditingController? namecontroller;
  TextEditingController? phonecontroller;
  TextEditingController? datecontroller;
  TextEditingController? heightcontroller;
  TextEditingController? weightcontroller;
  // TextEditingController? phonecontroller;
  DateTime? dateTime;
  @override
  void initState() {
    Auth().GetProfile().then((value) {
      setState(() {
        info=value;
        name=value.data.name;
        weight=value.data.weight;
        height=value.data.height;
        date=value.data.operationDate;
        phone=value.data.phone;
        namecontroller = TextEditingController(text: name);
        phonecontroller = TextEditingController(text: phone);
        datecontroller = TextEditingController(text: date);
        heightcontroller = TextEditingController(text: height);
        weightcontroller = TextEditingController(text: weight);

        //img=value.data.imagePath;
       // day=value.data.daysNumber.toString();
       //  ArticlesApi().getCategory(12,value.data.daysNumber).then((value) {
       //    setState(() {
       //      day_article=value;
       //    });
       //  });
      });
    });
    // TODO: implement initState
    super.initState();
  }
  //String? name,wight,img,day,height;

  @override
  void dispose() {
    namecontroller!.dispose();
    phonecontroller!.dispose();
    datecontroller!.dispose();
    heightcontroller!.dispose();
    weightcontroller!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:info==null?CircularProgressIndicator(): Column(
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneFormField(),
          // SizedBox(height: getProportionateScreenHeight(30)),
          // buildPasswordFormField(),

          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Expanded(flex:2,child:  buildDateFormField()),
              SizedBox(width: 5,),
              Expanded(flex:1,child: ButtonWidget3(btnText: 'ليس بعد' ,))
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTallFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildWightFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          ButtonWidget3(
            color: kbuttonColor,
            btnText: "تعديل البيانات",
            onClick: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                setState(() {
                  load=CircularProgressIndicator();
                });

                Auth().UpdateProfile(phone!
                  //  ,password!
                    ,name!,date!,int.parse(height!),int.parse(weight!)).then((value) {
                  if(value.success){
                    setState(() {
                      load=SizedBox();
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Row(
                      children: [
                        Icon(Icons.done,color: Colors.green,),
                        Text('${value.message}'),
                      ],
                    )));

                    SharedPreferences.getInstance().then((prefs) {
                     // prefs.setString('user_token', jsondata['data']['token']);
                      prefs.setString('user_name', name!);
                      prefs.setString('operation_date', date!);
                      prefs.setString('user_height',height!);
                      prefs.setString('user_weight', weight!);
                      //prefs.setString('user_image', jsondata['data']['user_info']['image_path']);
                     // prefs.setInt('days_number', jsondata['data']['user_info']['days_number']);
                      print('shared updated successfully to the user '+prefs.getString('user_name')!);

                    });


                    Navigator.push(context, MaterialPageRoute(builder: (c)=>MainBody()));
                  }else{
                    print(value.message.toString());
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${value.message}')));
                  }
                });


              }
            },
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          load,


          // DropdownButton(


        ],
      ),
    );
  }
  TextFormField buildNameFormField() {
    return TextFormField(
        controller: namecontroller,
      //initialValue: name,
        onSaved: (newValue) => name = newValue!,
        onChanged: (value) {
          setState(() {
            name = value;
          });
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "يرجى إدخال الاسم";
          } else {
            return null;
          }
        },
        decoration:CommonStyle.textFieldStyle(hintTextStr: 'اسم المستخدم',w:  Icon(Icons.person,color: kbuttonColor2,))

    );
  }
  TextFormField buildPhoneFormField() {

    return TextFormField(
      controller: phonecontroller,
        onSaved: (newValue) => phone = newValue!,
        onChanged: (value) {
          setState(() {
            phone = value;
          });
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "يرجى إدخال رقم الهاتف";
          } else {
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
          } else {
            return null;
          }
        },
        decoration:CommonStyle.textFieldStyle(hintTextStr: ' كلمة المرور',w: Icon(Icons.lock,color: kbuttonColor2,))

    );
  }


  TextFormField buildDateFormField() {
    // return TextFormField(
    //   controller: datecontroller,
    //   //  keyboardType: TextInputType.,
    //     onSaved: (newValue) => date = newValue!,
    //     onChanged: (value) {
    //       setState(() {
    //         date = value;
    //       });
    //     },
    //     decoration:CommonStyle.textFieldStyle(hintTextStr: 'تاريخ العملية',w:  Icon(Icons.calendar_today,color: kbuttonColor2,))
    //
    // );
    return TextFormField(

        // onTap: () async{
         // await getdate(datecontroller!);},
        controller: datecontroller==null?null:datecontroller!,
       // enabled: !enable,
        //  keyboardType: TextInputType.,
        onSaved: (newValue) => date = newValue!,
        onChanged: (value) {
          setState(() {
            date = value;
          });
        },
        decoration:CommonStyle.textFieldStyle(hintTextStr: 'تاريخ العملية',w:  InkWell(
            onTap: (){
              getdate(datecontroller!);
            },
            child: Icon(Icons.calendar_today,color: kbuttonColor2,)))

    );
  }

  TextFormField buildTallFormField() {
    return TextFormField(
      controller: heightcontroller,
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
      controller: weightcontroller,
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

   getdate(TextEditingController c) {
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


        // newid_date=c.text;
        // newbirthdate=c.text;

        //id_date=c.text;
        //controller2.text=dateTime!.day.toString()+'-'+dateTime!.month.toString()+'-'+dateTime!.year.toString();
      });
    });
  }
}
