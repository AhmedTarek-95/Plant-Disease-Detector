import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plant_disease_detector/src/login_page/new_paasword.dart';

class Forget_password extends StatelessWidget {
  static const String forgetPassword = 'Forget_password';
  GlobalKey<FormState> forgetKey =GlobalKey<FormState>();
  GlobalKey<FormState> codetKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/omar.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),

                  //#########################
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0,),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: forgetKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Forget Password",
                                style: TextStyle(
                                    fontSize: 39.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height:
                                20,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.name,
                                validator: (value)
                                {
                                  if (value == null ||value.isEmpty)
                                  {
                                    return 'Name must not be empty';
                                  }
                                  return null;
                                },
                                onFieldSubmitted: (String value) {
                                  print(value);
                                },
                                onChanged: (String value) {
                                  print(value);
                                },
                                decoration: InputDecoration(
                                  labelText: ' Full name ',
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (value)
                                {
                                  if (value == null ||value.isEmpty)
                                  {
                                    return 'Email must not be empty';
                                  }
                                  return null;
                                },
                                onFieldSubmitted: (String value) {
                                  print(value);
                                },
                                onChanged: (String value) {
                                  print(value);
                                },
                                decoration: InputDecoration(
                                  labelText: ' Your Email ',
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              ElevatedButton(
                                child: Text(' Send Code '),
                                onPressed: () {
                                  if(forgetKey.currentState!.validate())
                                    {
                                      print(' code sent ');
                                    }

                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(20.0),
                                  fixedSize: Size(130, 60),
                                  textStyle: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.bold),
                                  primary: Colors.green,
                                  onPrimary: Colors.white,
                                  elevation: 15,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                ),
                              ),
                              SizedBox(
                                height: 35.0,
                              ),
                              Form(
                                key: codetKey,
                                child: Column(
                                  children: [TextFormField(
                                    keyboardType: TextInputType.number,
                                    validator: (value)
                                    {
                                      if (value == null ||value.isEmpty)
                                      {
                                        return 'Code must not be empty';
                                      }
                                      return null;
                                    },
                                    onFieldSubmitted: (String value) {
                                      print(value);
                                    },
                                    onChanged: (String value) {
                                      print(value);
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'Inter code',
                                      fillColor: Colors.white,
                                      filled: true,
                                      suffixIcon: Icon(
                                        Icons.send,
                                        color: Colors.black,
                                      ),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    ElevatedButton(
                                      child: Text(' Confirm '),
                                      onPressed: () {
                                        if(codetKey.currentState!.validate())
                                        {
                                          Navigator.pushNamed(
                                            context,
                                            NewPassword.newPassword,
                                          );
                                        }

                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(20.0),
                                        fixedSize: Size(180, 60),
                                        textStyle: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.w700),
                                        primary: Colors.green,
                                        onPrimary: Colors.white,
                                        elevation: 15,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(40)),
                                      ),
                                    ),],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}